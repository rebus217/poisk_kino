part of 'login_bloc.dart';

abstract class LoginEvent {
  LoginEvent();
}

class LoginFirebase extends LoginEvent {
  LoginFirebase({required this.email, required this.password});

  final String email;
  final String password;
}
