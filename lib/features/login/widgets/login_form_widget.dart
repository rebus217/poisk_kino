import 'package:flutter/material.dart';
import 'package:poisk_kino/shared/shared.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({
    super.key,
  });

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
                Navigator.of(context).pushNamed("/films_list");
              },
              child: const Text("Login")),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              const Text("Not Registered Yet?"),
              TextButton(
                  onPressed: () {
                    _fetchLogin();
                  },
                  child: const Text("Register Now"))
            ],
          )
        ],
      ),
    );
  }

  void _fetchLogin() {
    // debugPrint("Register");
    // Navigator.of(context).pushNamed("/sing_up");
    String login = loginController.text.trim();
    String password = passwordController.text.trim();

    if (login.isEmpty || password.isEmpty) {
      //TODO: show error
      return;
    }
  }
}
