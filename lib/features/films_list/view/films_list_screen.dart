import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:poisk_kino/features/films_list/bloc/films_list_bloc.dart';

import 'package:poisk_kino/features/films_list/widgets/widgets.dart';
import 'package:poisk_kino/repositories/films_list/films_list.dart';
import 'package:poisk_kino/shared/models/models.dart';

class FilmsListScreen extends StatefulWidget {
  const FilmsListScreen({super.key});

  @override
  State<FilmsListScreen> createState() => _FilmsListScreenState();
}

class _FilmsListScreenState extends State<FilmsListScreen> {
  final _filmsListBloc = FilmsListBloc(GetIt.I<AbstractFilmsListRepository>());
  List<Film> filmList = <Film>[];
  bool isLastFilm = false;

  @override
  void initState() {
    _filmsListBloc.add(FilmsListLoad());
    super.initState();
  }

  void onAddFilmsToList() {
    _filmsListBloc.add(FilmsListLoad());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final IconThemeData iconTheme = theme.iconTheme;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Film List"),
          actions: [
            IconButton(
                onPressed: () {
                  context.push("/search_film");
                },
                icon: Icon(
                  Icons.search,
                  color: iconTheme.color,
                )),
            IconButton(
              onPressed: () {
                context.push("/film_collection");
              },
              icon: Icon(
                Icons.bookmark_border_outlined,
                color: iconTheme.color,
              ),
            ),
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                context.go("/");
              },
              icon: Icon(
                Icons.logout,
                color: iconTheme.color,
              ),
            )
          ],
        ),
        body: BlocBuilder<FilmsListBloc, FilmsListState>(
          bloc: _filmsListBloc,
          builder: (context, state) {
            if (state is FilmsListResponse) {
              filmList = state.filmList;
              isLastFilm = state.isLast;
            }
            if (state is FilmsListRequst) {}
            return FilmListWidget(
              filmList: filmList,
              hotLoadFilms: onAddFilmsToList,
              isLast: isLastFilm,
            );
          },
        ));
  }
}
