import 'package:ai_care/data/repositories/auth/firebase_auth_repository.dart';
import 'package:ai_care/domain/entities/user.dart';
import 'package:ai_care/domain/repositories/auth_repository_interfaces.dart';
import 'package:ai_care/domain/usecases/auth/login_usecase.dart';
import 'package:ai_care/domain/usecases/auth/login_with_google_usecase.dart';
import 'package:ai_care/domain/usecases/auth/logout_usecase.dart';
import 'package:ai_care/domain/usecases/auth/sign_up_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _authRepository = FirebaseAuthRepository.instance;

  AuthBloc() : super(AuthInitial()) {
    on<CheckIfLoggedInEvent>(_checkIfLoggedIn);
    on<LoginWithEmailAndPasswordEvent>(_loginOrSignup);
    on<LoginWithGoogleEvent>(_loginOrSignup);
    on<SignUpWithEmailAndPasswordEvent>(_loginOrSignup);
    on<LogoutEvent>(_logout);
  }

  void _checkIfLoggedIn(CheckIfLoggedInEvent event, Emitter<AuthState> emit) {
    if (_authRepository.user != null) {
      emit(Authenticated(user: _authRepository.user));
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> _loginOrSignup(AuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    AuthResult result = AuthResult(success: false);

    if (event is LoginWithEmailAndPasswordEvent) {
      result = await LoginUsecase(repository: _authRepository)
          .execute(email: event.email, password: event.password);
    } else if (event is LoginWithGoogleEvent) {
      result = await LoginWithGoogleUsecase(authRepository: _authRepository)
          .execute();
    } else if (event is SignUpWithEmailAndPasswordEvent) {
      result = await SignUpUsecase(repository: _authRepository)
          .execute(email: event.email, password: event.password);
    }

    if (result.success) {
      emit(Authenticated(user: result.user));
    } else {
      emit(AuthError(errorMessage: result.errorMessage));
    }
  }

  Future<void> _logout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await LogoutUsecase(repository: _authRepository).execute();
    emit(Unauthenticated());
  }
}
