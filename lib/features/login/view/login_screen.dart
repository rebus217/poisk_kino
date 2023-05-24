import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:ndialog/ndialog.dart';
import 'package:poisk_kino/features/login/bloc/login_bloc.dart';
import 'package:poisk_kino/features/login/login.dart';
import 'package:poisk_kino/repositories/auth/abstract_auth_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginBloc = LoginBloc(GetIt.I<AbstractAuthRepository>());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProgressDialog progressDialog = ProgressDialog(
      context,
      title: const Text("Logging In"),
      message: const Text("Please wait"),
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Please"),
        ),
        body: BlocListener<LoginBloc, LoginState>(
          bloc: _loginBloc,
          listener: (context, state) {
            if (state is LoginRequest) {
              progressDialog.show();
              return;
            }
            if (state is LoginResponse) {
              progressDialog.dismiss();
              Navigator.of(context).pushReplacementNamed("/films_list");
              return;
            }
            if (state is LoginRequestException) {
              progressDialog.dismiss();
              Fluttertoast.showToast(msg: "Something went wrong");
              return;
            }
            if (state is LoginRequestFirebaseException) {
              progressDialog.dismiss();
              if (state.exception.code == "user-not-found") {
                Fluttertoast.showToast(msg: "User not foun");
                return;
              }
              if (state.exception.code == "wrong-password") {
                Fluttertoast.showToast(msg: "Wrong password");
                return;
              }
              if (state.exception.code == "invalid-email") {
                Fluttertoast.showToast(msg: "Invalid Email");
                return;
              }
              Fluttertoast.showToast(
                  msg: "Something went wrong ${state.exception.code}");
            }
          },
          child: LoginFormWidget(
            loginBloc: _loginBloc,
          ),
        ));
  }
}
