part of 'sign_up_bloc.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpRequest extends SignUpState {}

class SignUpResponse extends SignUpState {}

class SignUpResponseException extends SignUpState {
  SignUpResponseException({required this.exception, required this.stackTrace});
  final exception;
  final stackTrace;
}

class SignUpResponseFirebaseException extends SignUpState {
  SignUpResponseFirebaseException({required this.exception});
  final FirebaseAuthException exception;
}
