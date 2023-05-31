import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poisk_kino/poisk_kino_dio.dart';
import 'package:poisk_kino/poisk_kino_get_It.dart';
import 'package:poisk_kino/router/router.dart';
import 'package:poisk_kino/theme/theme.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

class PoiskKinoAppWidget extends StatelessWidget {
  const PoiskKinoAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: mainTheme,
      routerConfig: router,
    );
  }
}

class PoiskKinoApp {
  Widget widget = const PoiskKinoAppWidget();

  final _talker = TalkerFlutter.init();

  final _dio = poiskKinoDio();

  void init() {
    poiskKinoGetItRegister(talker: _talker, dio: _dio);
    _runLogger();
  }

  void _runLogger() {
    _dio.interceptors.add(
      TalkerDioLogger(
        talker: _talker,
        settings: const TalkerDioLoggerSettings(
          printResponseData: false,
        ),
      ),
    );

    Bloc.observer = TalkerBlocObserver(
      talker: _talker,
      settings: const TalkerBlocLoggerSettings(
        printStateFullData: false,
        printEventFullData: false,
      ),
    );
  }
}
