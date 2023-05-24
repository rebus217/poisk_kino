import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:poisk_kino/repositories/auth/abstract_auth_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';

class FirebaseAuthRepository extends AbstractAuthRepository {
  final FirebaseAuth firebaseAuth = GetIt.I<FirebaseAuth>();

  @override
  void login(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      GetIt.I<Talker>().error("Firebase Login ${e.code}");

      if (e.code == "user-not-found") {
        Fluttertoast.showToast(msg: "User not foun");
      }
      if (e.code == "wrong-password") {
        Fluttertoast.showToast(msg: "Wrong password");
      }
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      Fluttertoast.showToast(msg: "Something went wrong");
    }
  }

  @override
  void logout() {
    firebaseAuth.signOut();
  }

  @override
  void register(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        Fluttertoast.showToast(msg: "Email is already in Use");
      }
      if (e.code == "weak-password") {
        Fluttertoast.showToast(msg: "Password is weak");
      }
      GetIt.I<Talker>().error("Unhandled firebase error ${e.code}");
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      Fluttertoast.showToast(msg: "Something went wrong");
    }
  }
}
