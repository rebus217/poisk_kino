import 'package:flutter/material.dart';
import 'package:poisk_kino/router/router.dart';
import 'package:poisk_kino/theme/theme.dart';

class PoiskKinoApp extends StatelessWidget {
  const PoiskKinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: mainTheme,
      routerConfig: router,
    );
  }
}
