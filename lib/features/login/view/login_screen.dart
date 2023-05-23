import 'package:flutter/material.dart';
import 'package:poisk_kino/features/login/login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Please"),
      ),
      body: const LoginFormWidget(),
    );
  }
}
