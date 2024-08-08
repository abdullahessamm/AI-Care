import 'package:ai_care/data/datasources/auth/auth_datasource_interface.dart';
import 'package:ai_care/domain/repositories/auth/auth_repository_interface.dart';

class LoginUsecase {
  final IAuthRepository _repository;

  LoginUsecase({required IAuthRepository repository})
      : _repository = repository;

  Future<bool> execute(
      {required String email, required String password}) async {
    AuthResult result =
        await _repository.login(email: email, password: password);

    return result.success;
  }
}
