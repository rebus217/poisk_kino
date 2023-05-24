part of 'login_bloc.dart';

abstract class LoginEvent {
  LoginEvent();
}

class FirebaseLogin extends LoginEvent {
  FirebaseLogin({required this.email, required this.password});

  final String email;
  final String password;
}
