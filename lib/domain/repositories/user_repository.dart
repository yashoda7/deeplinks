import "../entities/user.dart";

abstract class UserRepository {
  Future<Map<String, dynamic>>  signup(String name, String email, String password);
   Future<Map<String, dynamic>>  login(String email, String password);
}
