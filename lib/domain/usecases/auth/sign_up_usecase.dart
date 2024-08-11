import 'package:ai_care/domain/repositories/auth_repository_interfaces.dart';

class SignUpUsecase {
  final IAuthRepository _repository;

  SignUpUsecase({required IAuthRepository repository})
      : _repository = repository;

  Future<AuthResult> execute(
      {required String email, required String password}) async {
    return await _repository.signUp(email: email, password: password);
  }
}
