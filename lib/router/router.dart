import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poisk_kino/features/film_collection/film_collection.dart';
import 'package:poisk_kino/features/film_detail/film_detail.dart';
import 'package:poisk_kino/features/films_list/films_list.dart';
import 'package:poisk_kino/features/login/login.dart';
import 'package:poisk_kino/features/search_film/search_film.dart';
import 'package:poisk_kino/features/sing_up/sing_up.dart';

final Map<String, StatefulWidget Function(BuildContext context)> routes = {
  "/": (BuildContext context) => FirebaseAuth.instance.currentUser == null
      ? const LoginScreen()
      : const FilmsListScreen(),
  "/login": (BuildContext context) => const LoginScreen(),
  "/sing_up": (BuildContext context) => const SingUpScreen(),
  "/film_collection": (BuildContext context) => const FilmCollectionScreen(),
  "/film": (BuildContext context) => const FilmDetailsScreen(),
  "/films_list": (BuildContext context) => const FilmsListScreen(),
  "/search_film": (BuildContext context) => const SearchFilmScreen(),
};
