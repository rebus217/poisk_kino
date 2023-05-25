import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:poisk_kino/features/login/bloc/login_bloc.dart';
import 'package:poisk_kino/shared/shared.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({
    super.key,
    required this.loginBloc,
  });

  final LoginBloc loginBloc;

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  var loginController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextInputWidget(
            name: "Login",
            controller: loginController,
          ),
          TextInputWidget(
            name: "Password",
            obscureText: true,
            controller: passwordController,
          ),
          ElevatedButton(
            onPressed: () {
              _fetchLogin();
            },
            child: const Text("Login"),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              const Text("Not Registered Yet?"),
              TextButton(
                onPressed: () {
                  context.push("/sing_up");
                },
                child: const Text("Register Now"),
              )
            ],
          )
        ],
      ),
    );
  }

  void _fetchLogin() async {
    String email = loginController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all fields");
      return;
    }
    widget.loginBloc.add(LoginFirebase(email: email, password: password));
  }
}
