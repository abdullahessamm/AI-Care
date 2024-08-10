import 'package:ai_care/domain/repositories/auth_repository_interfaces.dart';

class LogoutUsecase {
  final IAuthRepository _repository;

  LogoutUsecase({required IAuthRepository repository})
      : _repository = repository;

  Future<void> execute() async {
    await _repository.logout();
  }
}
