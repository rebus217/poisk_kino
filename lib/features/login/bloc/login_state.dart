part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginRequest extends LoginState {}

class LoginResponse extends LoginState {}

class LoginRequestException extends LoginState {
  LoginRequestException({required this.exception, required this.stackTrace});
  final exception;
  final stackTrace;
}

class LoginRequestFirebaseException extends LoginState {
  LoginRequestFirebaseException({required this.exception});
  final FirebaseAuthException exception;
}
