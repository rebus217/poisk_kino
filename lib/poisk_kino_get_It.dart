import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'package:talker_flutter/talker_flutter.dart';

import 'repositories/auth/auth.dart';
import 'repositories/films_list/films_list.dart';

void poiskKinoGetItRegister({required Talker talker, required Dio dio}) {
  GetIt.I.registerSingleton(talker);

  GetIt.I.registerLazySingleton(() => FirebaseAuth.instance);

  GetIt.I.registerLazySingleton<AbstractAuthRepository>(
      () => FirebaseAuthRepository());

  GetIt.I.registerLazySingleton<AbstractFilmsListRepository>(
      () => KinopoiskFilmListRepository(dio: dio));
}
