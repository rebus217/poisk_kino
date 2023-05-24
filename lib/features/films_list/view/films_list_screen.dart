import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poisk_kino/features/films_list/bloc/films_list_bloc.dart';
import 'package:poisk_kino/repositories/films_list/films_list.dart';

class FilmsListScreen extends StatefulWidget {
  const FilmsListScreen({super.key});

  @override
  State<FilmsListScreen> createState() => _FilmsListScreenState();
}

class _FilmsListScreenState extends State<FilmsListScreen> {
  final _filmsListBloc = FilmsListBloc(GetIt.I<AbstractFilmsListRepository>());

  @override
  void initState() {
    _filmsListBloc.add(FilmsListLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Film List"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/search_film");
                },
                icon: const Icon(Icons.search)),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/film_collection");
              },
              icon: const Icon(Icons.bookmark_border_outlined),
            ),
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed("/");
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: BlocBuilder<FilmsListBloc, FilmsListState>(
          bloc: _filmsListBloc,
          builder: (context, state) {
            return Placeholder();
          },
        ));
  }
}
