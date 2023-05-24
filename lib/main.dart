import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poisk_kino/firebase_options.dart';
import 'package:poisk_kino/poisk_kino_app.dart';
import 'package:poisk_kino/repositories/auth/abstract_auth_repository.dart';
import 'package:poisk_kino/repositories/auth/firebase_auth_repository.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);

  GetIt.I.registerLazySingleton(() => FirebaseAuth.instance);
  GetIt.I.registerLazySingleton<AbstractAuthRepository>(
      () => FirebaseAuthRepository());

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
      printStateFullData: false,
      printEventFullData: false,
    ),
  );

  runApp(const PoiskKinoApp());
}
