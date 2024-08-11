import 'package:ai_care/domain/repositories/auth_repository_interfaces.dart';

class LoginUsecase {
  final IAuthRepository _repository;

  LoginUsecase({required IAuthRepository repository})
      : _repository = repository;

  Future<AuthResult> execute(
      {required String email, required String password}) async {
    return await _repository.login(email: email, password: password);
  }
}
