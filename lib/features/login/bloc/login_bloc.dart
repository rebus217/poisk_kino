import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poisk_kino/repositories/auth/abstract_auth_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.authRepository) : super(LoginInitial()) {
    on<FirebaseLogin>((event, emit) async {
      try {
        emit(LoginRequest());
        await authRepository.login(event.email, event.password);
        emit(LoginResponse());
      } on FirebaseAuthException catch (e) {
        emit(LoginRequestFirebaseException(exception: e));
      } catch (e, st) {
        emit(LoginRequestException(exception: e, stackTrace: st));
      }
    });
  }

  final AbstractAuthRepository authRepository;
}
