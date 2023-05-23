import 'package:flutter/material.dart';
import 'package:poisk_kino/shared/widgets/text_input_widget.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextInputWidget(
            name: "Name",
            controller: nameController,
          ),
          TextInputWidget(
            name: "Email",
            controller: emailController,
          ),
          TextInputWidget(
            name: "Password",
            obscureText: true,
            controller: passwordController,
          ),
          TextInputWidget(
            name: "Confirm Password",
            obscureText: true,
            controller: confirmPasswordController,
          ),
          ElevatedButton(
              onPressed: () {
                _fetchRegistration();
              },
              child: const Text("Register")),
        ],
      ),
    );
  }

  void _fetchRegistration() {
    String name = nameController.text.trim();
    String password = passwordController.text.trim();
    String email = emailController.text.trim();
    String confirmPass = confirmPasswordController.text.trim();
    
    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPass.isEmpty) {
      //TODO: show error
      return;
    }
    if (password.length < 6) {
      //TODO: show error
      return;
    }
    if (password != confirmPass) {
      //TODO: show error
      return;
    }
    //TODO: request to firebase auth
    return;
  }
}
