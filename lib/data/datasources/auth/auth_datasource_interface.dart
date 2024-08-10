import 'package:ai_care/domain/entities/user.dart';

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
