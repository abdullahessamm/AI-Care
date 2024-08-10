import 'package:ai_care/domain/repositories/auth_repository_interfaces.dart';

class LoginWithGoogleUsecase {
  final IAuthWithGoogleRepository authRepository;

  LoginWithGoogleUsecase({required this.authRepository});

  Future<bool> execute() async {
    AuthResult result = await authRepository.loginWithGoogle();
    return result.success;
  }
}
