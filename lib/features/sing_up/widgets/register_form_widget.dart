import 'package:flutter/material.dart';
import 'package:poisk_kino/shared/widgets/text_input_widget.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextInputWidget(name: "Name"),
          const TextInputWidget(name: "Email"),
          const TextInputWidget(
            name: "Password",
            obscureText: true,
          ),
          const TextInputWidget(
            name: "Confirm Password",
            obscureText: true,
          ),
          ElevatedButton(
              onPressed: () {
                debugPrint("Register");
              },
              child: const Text("Register")),
        ],
      ),
    );
  }
}
