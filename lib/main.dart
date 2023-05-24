import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poisk_kino/firebase_options.dart';
import 'package:poisk_kino/poisk_kino_app.dart';
import 'package:poisk_kino/repositories/auth/abstract_auth_repository.dart';
import 'package:poisk_kino/repositories/auth/firebase_auth_repository.dart';
import 'package:poisk_kino/repositories/films_list/films_list.dart';
import 'package:poisk_kino/repositories/films_list/kinopoisk_films_list.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);

  GetIt.I.registerLazySingleton(() => FirebaseAuth.instance);

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
      printStateFullData: false,
      printEventFullData: false,
    ),
  );

  final dio = Dio(
    BaseOptions(
      baseUrl: "https://kinopoiskapiunofficial.tech/api/v2.2",
      headers: {
        'X-API-KEY': '38c7b8c7-0f8a-4a69-a22c-25c75d9d1ee5',
        'Content-Type': 'application/json',
      },
    ),
  );
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printResponseData: false,
      ),
    ),
  );

  GetIt.I.registerLazySingleton<AbstractAuthRepository>(
      () => FirebaseAuthRepository());

  GetIt.I.registerLazySingleton<AbstractFilmsListRepository>(
      () => KinopoiskFilmListRepository(dio: dio));

  runApp(const PoiskKinoApp());
}
