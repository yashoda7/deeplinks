// lib/data/models/user_model.dart
import '../../domain/entities/user.dart';

class UserModel extends User {
 UserModel({
  required String id,
  required String token,
  String name = '',
  String email = '',
}) : super(id: id, name: name, email: email, token: token);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '', // if backend doesn't return _id, generate empty string
      token: json['token'],  // must exist
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'token': token,
    };
  }
}
