// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'core/di/injection.dart' as di;
import 'package:deeplinks/presentations/authentication/bloc/auth_bloc.dart';
import 'package:deeplinks/presentations/authentication/presentation/login_page.dart';
import 'package:deeplinks/presentations/authentication/presentation/signup_page.dart';
import 'package:deeplinks/presentations/home/home_page.dart';
void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await di.init(); // ensure dependencies are initialized
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => LoginPage()),
      GoRoute(path: '/signup', builder: (context, state) => SignupPage()),
      GoRoute(path: '/home', builder: (context, state) => HomePage()),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<AuthBloc>(), // make sure AuthBloc is registered in GetIt
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
