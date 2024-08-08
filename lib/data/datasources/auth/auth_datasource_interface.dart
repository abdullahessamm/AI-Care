import 'package:ai_care/domain/entities/user.dart';

abstract class IAuthDatasource {
  Future<AuthResult> login({required String email, required String password});
  Future<AuthResult> signUp({required String email, required String password});
  Future<void> logout();
  Stream<User?> get userStream;
}

class AuthResult {
  final bool success;
  final User? user;
  final String? errorMessage;

  AuthResult({required this.success, this.user, this.errorMessage});

  factory AuthResult.success(User user) =>
      AuthResult(success: true, user: user);
  factory AuthResult.failure(String errorMessage) =>
      AuthResult(success: false, errorMessage: errorMessage);
}
