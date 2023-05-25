part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class SignUpFirebase extends SignUpEvent {
  SignUpFirebase({
    required this.email,
    required this.password,
    required this.fullName,
  });

  final String email;
  final String password;
  final String fullName;
}
