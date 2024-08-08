import 'package:ai_care/data/datasources/auth/auth_datasource_interface.dart';
import 'package:ai_care/domain/entities/user.dart';

abstract class IAuthRepository {
  Future<AuthResult> login({required String email, required String password});
  Future<AuthResult> signUp({required String email, required String password});
  Future<void> logout();
  Stream<User?> get userStream;
}
