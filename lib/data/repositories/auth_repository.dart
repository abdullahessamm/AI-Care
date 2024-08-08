import 'package:ai_care/data/datasources/auth/auth_datasource_interface.dart';
import 'package:ai_care/domain/entities/user.dart';
import 'package:ai_care/domain/repositories/auth/auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final IAuthDatasource _authDatasource;

  AuthRepository({required IAuthDatasource authDatasource})
      : _authDatasource = authDatasource;

  @override
  Future<AuthResult> login({required String email, required String password}) {
    return _authDatasource.login(email: email, password: password);
  }

  @override
  Future<void> logout() {
    return _authDatasource.logout();
  }

  @override
  Future<AuthResult> signUp({required String email, required String password}) {
    return _authDatasource.signUp(email: email, password: password);
  }

  @override
  Stream<User?> get userStream => _authDatasource.userStream;
}
