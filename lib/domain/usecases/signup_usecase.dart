// lib/domain/usecases/signup_usecase.dart
import '../repositories/user_repository.dart';

class SignupUseCase {
  final UserRepository repository;
  SignupUseCase(this.repository);

  Future<Map<String, dynamic>> call(String name, String email, String password) async {
    return await repository.signup(name, email, password);
  }
}
