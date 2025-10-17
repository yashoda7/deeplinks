// lib/main.dart
import 'package:deeplinks/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deeplinks/theme/app_theme.dart';
import 'core/di/injection.dart' as di;
import 'package:deeplinks/presentations/authentication/bloc/auth_bloc.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await di.init(); // ensure dependencies are initialized
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<AuthBloc>(), // make sure AuthBloc is registered in GetIt
        ),
      ],
      child: MaterialApp.router(
        theme: AppTheme.lightTheme,
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
