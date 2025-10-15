// lib/domain/usecases/signup_usecase.dart
import '../entities/user.dart';
import '../repositories/user_repository.dart';
import 'package:deeplinks/data/models/user_model.dart';

class SignupUseCase {
  final UserRepository repository;
  SignupUseCase(this.repository);

  Future<User> call(String name, String email, String password) {
    return repository.signup(name, email, password);
  }
}
