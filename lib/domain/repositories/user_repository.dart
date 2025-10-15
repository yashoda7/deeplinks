import "../entities/user.dart";

abstract class UserRepository {
  Future<User> signup(String name, String email, String password);
  Future<User> login(String email, String password);
}
