import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poisk_kino/features/film_collection/film_collection.dart';
import 'package:poisk_kino/features/film_detail/film_detail.dart';
import 'package:poisk_kino/features/films_list/films_list.dart';
import 'package:poisk_kino/features/login/login.dart';
import 'package:poisk_kino/features/search_film/search_film.dart';
import 'package:poisk_kino/features/sign_up/sing_up.dart';

// final Map<String, StatefulWidget Function(BuildContext context)> routes = {
//   "/": (BuildContext context) => FirebaseAuth.instance.currentUser == null
//       ? const LoginScreen()
//       : const FilmsListScreen(),
//   "/login": (BuildContext context) => const LoginScreen(),
//   "/sing_up": (BuildContext context) => const SignUpScreen(),
//   "/film_collection": (BuildContext context) => const FilmCollectionScreen(),
//   "/film": (BuildContext context) => const FilmDetailsScreen(),
//   "/films_list": (BuildContext context) => const FilmsListScreen(),
//   "/search_film": (BuildContext context) => const SearchFilmScreen(),
// };

final router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => FirebaseAuth.instance.currentUser == null
        ? const LoginScreen()
        : const FilmsListScreen(),
  ),
  GoRoute(
    path: "/login",
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: "/sing_up",
    builder: (context, state) => const SignUpScreen(),
  ),
  GoRoute(
    path: "/film_collection",
    builder: (context, state) => const FilmCollectionScreen(),
  ),
  GoRoute(
    path: "/films_list",
    builder: (context, state) => const FilmsListScreen(),
  ),
  GoRoute(
    path: "/film",
    builder: (context, state) {
      final String filmName = state.queryParameters["filmName"] as String;
      final String filmId = state.queryParameters["filmId"] as String;
      return FilmDetailsScreen(
        filmId: int.parse(filmId),
        filmName: filmName,
      );
    },
  ),
  GoRoute(
    path: "/search_film",
    builder: (context, state) => const SearchFilmScreen(),
  ),
]);
