import 'package:flutter/material.dart';
import 'package:poisk_kino/router/router.dart';

class PoiskKinoApp extends StatelessWidget {
  const PoiskKinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: routes,
    );
  }
}
