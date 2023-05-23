import 'package:flutter/material.dart';
import 'package:poisk_kino/features/sing_up/widgets/widgets.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sing up"),
      ),
      body: const RegisterFormWidget(),
    );
  }
}
