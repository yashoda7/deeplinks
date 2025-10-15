// lib/presentation/blocs/auth_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
// import '../../domain/usecases/signup_usecase.dart';
import 'package:deeplinks/domain/usecases/signup_usecase.dart';
import 'package:deeplinks/domain/usecases/login_usecase.dart';
import 'package:deeplinks/domain/entities/user.dart' ;
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignupUseCase signupUseCase;
  final LoginUseCase loginUseCase;

  AuthBloc({required this.signupUseCase, required this.loginUseCase})
      : super(AuthInitial()) {
    
    // ---------------- Signup ----------------
    on<SignupEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        // Call use case, which returns both user and message
        final result = await signupUseCase(event.name, event.email, event.password);
        final user = result;        // may be null
        final message = result.name;  // backend message

        emit(AuthSuccess(user: user, message: message));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    // ---------------- Login ----------------
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final result = await loginUseCase(event.email, event.password);
        final user = result;
        final message=result.email;

        if (user != null && user.token.isNotEmpty) {
          await _saveToken(user.token);
          emit(AuthSuccess(user: user, message: message ?? "Login successful"));
        } else {
          emit(AuthError("Login failed"));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}
