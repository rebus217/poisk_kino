part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class SignUpFirebase extends SignUpEvent {
  SignUpFirebase({required this.email, required this.password});

  final String email;
  final String password;
}
