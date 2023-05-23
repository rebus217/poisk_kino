import 'package:flutter/material.dart';
import 'package:poisk_kino/shared/shared.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextInputWidget(name: "Login"),
          const TextInputWidget(
            name: "Password",
            obscureText: true,
          ),
          ElevatedButton(
              onPressed: () {
                debugPrint("Login");
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
                    debugPrint("Register");
                    Navigator.of(context).pushNamed("/sing_up");
                  },
                  child: const Text("Register Now"))
            ],
          )
        ],
      ),
    );
  }
}
