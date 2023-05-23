import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:poisk_kino/firebase_options.dart';
import 'package:poisk_kino/poisk_kino_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const PoiskKinoApp());
}
