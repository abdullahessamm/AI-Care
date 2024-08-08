import 'package:ai_care/domain/repositories/auth/auth_repository_interface.dart';

class LogoutUsecase {
  final IAuthRepository _repository;

  LogoutUsecase({required IAuthRepository repository})
      : _repository = repository;

  Future<void> execute() async {
    await _repository.logout();
  }
}
