// lib/data/datasources/user_remote_data_source.dart
import 'package:dio/dio.dart';
import '../../core/network/dio_client.dart';
import 'package:deeplinks/data/models/user_model.dart';
  import 'package:shared_preferences/shared_preferences.dart';
class UserRemoteDataSource {
  final DioClient dioClient;

  UserRemoteDataSource(this.dioClient);

 Future<Map<String, dynamic>> signup(String name, String email, String password) async {
  try {
    final response = await dioClient.dio.post(
      "/auth/signup",
      data: {
        "name": name,
        "email": email,
        "password": password,
      },
    );

    // Example backend response:
    // {
    //   "message": "User created successfully",
    //   "user": {
    //       "_id": "12345",
    //       "token": "eyJhbGc..."
    //   }
    // }

    final data = response.data;
    

    return {
     "user": data["user"] != null ? UserModel.fromJson(data["user"]) : null,

      "message": data["message"] ?? "Signup successful",
    };
  } catch (e) {
    
  throw Exception("Remote request failed: $e");

  }
}

Future<Map<String, dynamic>> login(String email, String password) async {
  try {
    final response = await dioClient.dio.post("/auth/login", data: {
      "email": email,
      "password": password,
    });

    final data = response.data;

    // 1️⃣ Get token from backend response
    final String token = data["token"];

    // 2️⃣ Save token locally using SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);

    // 3️⃣ Optionally, create UserModel
    final user = token != null ? UserModel(id: '', token: token) : null;

    return {
      "user": user,
      "message": data["message"] ?? "Login successful",
    };
  } catch (e) {
    throw Exception("Login failed: $e");
  }
}

}
