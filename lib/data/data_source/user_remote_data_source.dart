// lib/data/datasources/user_remote_data_source.dart
import 'package:dio/dio.dart';
import '../../core/network/dio_client.dart';
import 'package:deeplinks/data/models/user_model.dart';

class UserRemoteDataSource {
  final DioClient dioClient;

  UserRemoteDataSource(this.dioClient);

  Future<UserModel> signup(String name, String email, String password) async {
    final response = await dioClient.dio.post("/auth/signup", data: {
      "name": name,
      "email": email,
      "password": password,
    });

    return UserModel.fromJson(response.data);
  }

  Future<UserModel> login(String email, String password) async {
    final response = await dioClient.dio.post("/auth/login", data: {
      "email": email,
      "password": password,
    });

    return UserModel.fromJson(response.data);
  }
}
