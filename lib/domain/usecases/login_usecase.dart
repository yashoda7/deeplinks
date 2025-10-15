// lib/domain/usecases/login_usecase.dart
import '../repositories/user_repository.dart';
import '../entities/user.dart';
class LoginUseCase {
  final UserRepository repository;
  LoginUseCase(this.repository);

  Future<User> call(String email, String password) {
    return repository.login(email, password);
  }
}
