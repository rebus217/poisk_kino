import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:ndialog/ndialog.dart';
import 'package:poisk_kino/shared/widgets/text_input_widget.dart';
import 'package:talker_flutter/talker_flutter.dart';

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
    ProgressDialog progressDialog = ProgressDialog(
      context,
      title: const Text("Signing Up"),
      message: const Text("Please wait"),
    );
    try {
      progressDialog.show();

      UserCredential userCredential =
          await GetIt.I<FirebaseAuth>().createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        //TODO: store user information in Realtime database

        Navigator.of(context).pop();
      } else {
        Fluttertoast.showToast(msg: "Failed");
      }

      progressDialog.dismiss();
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        Fluttertoast.showToast(msg: "Email is already in Use");
      }
      if (e.code == "weak-password") {
        Fluttertoast.showToast(msg: "Password is weak");
      }
      GetIt.I<Talker>().error("Unhandled firebase error ${e.code}");
      progressDialog.dismiss();
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      Fluttertoast.showToast(msg: "Something went wrong");
      progressDialog.dismiss();
    }
  }
}
