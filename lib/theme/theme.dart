import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.yellow,
    scaffoldBackgroundColor: const Color.fromARGB(255, 37, 36, 36),
    appBarTheme: const AppBarTheme(
      elevation: 0,
        backgroundColor: Color.fromARGB(255, 37, 36, 36),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        )),
    textTheme: TextTheme(
        bodyMedium: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        labelSmall: TextStyle(
          color: Colors.white.withOpacity(0.6),
          fontWeight: FontWeight.w700,
          fontSize: 14,
        )),
    dividerColor: const Color.fromARGB(141, 221, 219, 219),
    listTileTheme: const ListTileThemeData(iconColor: Colors.white),
    );
