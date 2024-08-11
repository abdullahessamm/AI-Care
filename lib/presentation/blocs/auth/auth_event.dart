part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class CheckIfLoggedInEvent extends AuthEvent {}

class LoginWithEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;

  LoginWithEmailAndPasswordEvent({required this.email, required this.password});
}

class LoginWithGoogleEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}

class SignUpWithEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;

  SignUpWithEmailAndPasswordEvent(
      {required this.email, required this.password});
}
