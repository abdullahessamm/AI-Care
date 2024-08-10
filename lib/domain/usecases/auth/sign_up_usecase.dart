import 'package:ai_care/domain/repositories/auth_repository_interfaces.dart';

class SignUpUsecase {
  final IAuthRepository _repository;

  SignUpUsecase({required IAuthRepository repository})
      : _repository = repository;

  Future<bool> execute(
      {required String email, required String password}) async {
    AuthResult result =
        await _repository.signUp(email: email, password: password);

    return result.success;
  }
}
