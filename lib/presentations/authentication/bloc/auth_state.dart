// lib/presentation/blocs/auth_state.dart
part of 'auth_bloc.dart';


abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {
  final String message; // optional
  final User? user;

  AuthSuccess({required this.user, this.message = "Success"});
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

