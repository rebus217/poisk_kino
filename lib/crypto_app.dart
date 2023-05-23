import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_flutter/router/router.dart';
import 'package:learning_flutter/theme/theme.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto coins',
      theme: darkTheme,
      routes: routes,
      navigatorObservers: [TalkerRouteObserver(GetIt.I<Talker>())],
    );
  }
}
