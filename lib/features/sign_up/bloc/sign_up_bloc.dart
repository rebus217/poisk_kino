import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poisk_kino/repositories/auth/auth.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(this.authRepository) : super(SignUpInitial()) {
    on<SignUpFirebase>((event, emit) async {
      try {
        emit(SignUpRequest());
        await authRepository.signup(event.email, event.password);
        emit(SignUpResponse());
      } on FirebaseAuthException catch (e) {
        emit(SignUpResponseFirebaseException(exception: e));
      } catch (e, st) {
        emit(SignUpResponseException(exception: e, stackTrace: st));
      }
    });
  }
  final AbstractAuthRepository authRepository;
}
