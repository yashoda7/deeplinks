// lib/presentation/blocs/auth_event.dart
part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignupEvent extends AuthEvent {
  final String name, email, password;
  SignupEvent(this.name, this.email, this.password);
}

class LoginEvent extends AuthEvent {
  final String email, password;
  LoginEvent(this.email, this.password);
}
