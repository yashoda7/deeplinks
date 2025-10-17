import 'package:deeplinks/presentations/authentication/presentation/login_page.dart';
import 'package:deeplinks/presentations/authentication/presentation/signup_page.dart';
import 'package:deeplinks/presentations/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:deeplinks/routes.dart';


final GoRouter appRouter = GoRouter(
  initialLocation: '/login', // Start at login
  routes: [
    GoRoute(
      path: routes.login,
      name: 'login',
      pageBuilder: (context, state) =>  MaterialPage(
        child: LoginPage(),
      ),
    ),
    GoRoute(
      path: routes.signup,
      name: 'signup',
      pageBuilder: (context, state) =>  MaterialPage(
        child: SignupPage(),
      ),
    ),
    GoRoute(
      path: routes.home,
      name: 'home',
      pageBuilder: (context, state) =>  MaterialPage(
        child: HomePage(),
      ),
    ),
  ],
);
