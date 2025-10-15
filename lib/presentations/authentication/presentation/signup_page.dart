// lib/presentation/pages/signup_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import '../blocs/auth_bloc.dart';
import '../bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) context.go('/');
            if (state is AuthError) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          },
          builder: (context, state) {
            if (state is AuthLoading) return Center(child: CircularProgressIndicator());
            return Column(
              children: [
                TextField(controller: nameController, decoration: InputDecoration(labelText: "Name")),
                TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
                TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => context.read<AuthBloc>().add(SignupEvent(
                    nameController.text,
                    emailController.text,
                    passwordController.text,
                  )),
                  child: Text("Signup"),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
