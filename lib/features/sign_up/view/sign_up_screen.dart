import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:ndialog/ndialog.dart';
import 'package:poisk_kino/features/sign_up/bloc/sign_up_bloc.dart';
import 'package:poisk_kino/features/sign_up/widgets/widgets.dart';
import 'package:poisk_kino/repositories/auth/auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpBloc _signUpBloc = SignUpBloc(GetIt.I<AbstractAuthRepository>());
  @override
  Widget build(BuildContext context) {
    ProgressDialog progressDialog = ProgressDialog(
      context,
      title: const Text("Signing Up"),
      message: const Text("Please wait"),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sing up"),
      ),
      body: BlocListener<SignUpBloc, SignUpState>(
        bloc: _signUpBloc,
        listener: (context, state) {
          if (state is SignUpRequest) {
            progressDialog.show();
          }
          if (state is SignUpResponse) {
            /// store user information in Realtime database
            progressDialog.dismiss();
            context.go("/films_list");
          }
          if (state is SignUpResponseException) {
            progressDialog.dismiss();
            Fluttertoast.showToast(msg: "Something went wrong");
            return;
          }
          if (state is SignUpResponseFirebaseException) {
            progressDialog.dismiss();
            if (state.exception.code == "email-already-in-use") {
              Fluttertoast.showToast(msg: "Email is already in Use");
            }
            if (state.exception.code == "weak-password") {
              Fluttertoast.showToast(msg: "Password is weak");
            }
            return;
          }
        },
        child: RegisterFormWidget(
          signUpBloc: _signUpBloc,
        ),
      ),
    );
  }
}
