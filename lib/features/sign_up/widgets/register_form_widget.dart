import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:poisk_kino/features/sign_up/bloc/sign_up_bloc.dart';
import 'package:poisk_kino/shared/widgets/text_input_widget.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key, required this.signUpBloc});
  final SignUpBloc signUpBloc;

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

  void _fetchRegistration() async {
    String name = nameController.text.trim();
    String password = passwordController.text.trim();
    String email = emailController.text.trim();
    String confirmPass = confirmPasswordController.text.trim();

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPass.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all fields");
      return;
    }
    if (password.length < 6) {
      Fluttertoast.showToast(
          msg: "Weak Password, at leas 6 characters are required");
      return;
    }
    if (password != confirmPass) {
      Fluttertoast.showToast(msg: "Passwords do not match");
      return;
    }
    widget.signUpBloc
        .add(SignUpFirebase(email: email, password: password, fullName: name));
  }
}
