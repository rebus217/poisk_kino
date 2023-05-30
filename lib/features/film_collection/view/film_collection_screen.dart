import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poisk_kino/features/film_collection/bloc/film_collection_bloc.dart';
import 'package:poisk_kino/features/films_list/widgets/widgets.dart';

class FilmCollectionScreen extends StatefulWidget {
  const FilmCollectionScreen({super.key});

  @override
  State<FilmCollectionScreen> createState() => _FilmCollectionScreenState();
}

class _FilmCollectionScreenState extends State<FilmCollectionScreen> {
  final FilmCollectionListBloc _filmCollectionBloc = FilmCollectionListBloc();

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
      body: BlocBuilder<FilmCollectionListBloc, FilmCollectionListState>(
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
