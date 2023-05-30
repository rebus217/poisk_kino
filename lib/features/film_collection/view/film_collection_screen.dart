import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poisk_kino/features/film_collection/bloc/film_collection_bloc.dart';
import 'package:poisk_kino/features/films_list/widgets/widgets.dart';
import 'package:poisk_kino/repositories/films_list/films_list.dart';

class FilmCollectionScreen extends StatefulWidget {
  const FilmCollectionScreen({super.key});

  @override
  State<FilmCollectionScreen> createState() => _FilmCollectionScreenState();
}

class _FilmCollectionScreenState extends State<FilmCollectionScreen> {
  final FilmCollectionBloc _filmCollectionBloc = FilmCollectionBloc();

  @override
  void initState() {
    _filmCollectionBloc.add(LoadFilmCollection());
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Collection"),
      ),
      body: BlocBuilder<FilmCollectionBloc, FilmCollectionState>(
        bloc: _filmCollectionBloc,
        builder: (context, state) {
          if (state is FilmCollectionRes) {
            return FilmListWidget(
              filmList: state.filmList,
              isLast: true,
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
