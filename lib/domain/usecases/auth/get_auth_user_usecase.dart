import 'package:ai_care/domain/entities/user.dart';
import 'package:ai_care/domain/repositories/auth_repository_interfaces.dart';

class GetAuthUserUsecase {
  final IAuthRepository repository;

  GetAuthUserUsecase(this.repository);

  Stream<User?> execute() {
    return repository.userStream;
  }
}
