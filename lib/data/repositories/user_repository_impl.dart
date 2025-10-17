// lib/data/repositories/user_repository_impl.dart
import 'package:deeplinks/data/models/user_model.dart';
import 'package:deeplinks/domain/entities/user.dart';
import 'package:deeplinks/domain/repositories/user_repository.dart';
import '../data_source/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<Map<String, dynamic>> signup(String name, String email, String password) async {
    final response = await remoteDataSource.signup(name, email, password);
    return {
      "user": response["user"] != null ? UserModel.fromJson(response["user"]) : null,
      "message": response["message"] ?? "User created successfully"
    };
  }

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await remoteDataSource.login(email, password);
    return {
      "user": response["user"] != null ? UserModel.fromJson(response["user"]) : null,
      "message": response["message"] ?? "Login successful"
    };
  }
}
