import 'package:flutter/material.dart';

final ThemeData mainTheme = ThemeData(
  scaffoldBackgroundColor: Colors.blueGrey.shade900,
  primarySwatch: Colors.blueGrey,
  listTileTheme: ListTileThemeData(
    tileColor: Colors.blueGrey.shade600,
    iconColor: Colors.white,
    titleTextStyle: const TextStyle(
      color: Colors.white,
    ),
    subtitleTextStyle: const TextStyle(
      color: Colors.white,
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      color: Colors.white,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.white),
    ),
    hintStyle: TextStyle(
      color: Colors.white,
    ),
  ),
);
