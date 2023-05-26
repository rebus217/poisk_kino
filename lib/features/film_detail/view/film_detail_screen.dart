import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poisk_kino/features/film_detail/collection_film_bloc/collection_film_bloc.dart';
import 'package:poisk_kino/features/film_detail/load_film_bloc/film_detail_bloc.dart';

import 'package:poisk_kino/features/film_detail/widgets/widgets.dart';
import 'package:poisk_kino/repositories/films_list/films_list.dart';
import 'package:poisk_kino/repositories/films_list/models/film_model.dart';

class FilmDetailsScreen extends StatefulWidget {
  const FilmDetailsScreen({super.key, required this.film});

  final Film film;

  @override
  State<FilmDetailsScreen> createState() => _FilmDetailsScreenState();
}

class _FilmDetailsScreenState extends State<FilmDetailsScreen> {
  final FilmDetailBloc _filmDetailBloc =
      FilmDetailBloc(GetIt.I<AbstractFilmsListRepository>());

  final CollectionFilmBloc _saveFilmBloc =
      CollectionFilmBloc(GetIt.I<AbstractFilmsListRepository>());

  bool isSaved = false;

  @override
  void initState() {
    _filmDetailBloc.add(FilmDetailLoad(filmId: widget.film.filmId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.film.nameRu),
      ),
      body: BlocBuilder<FilmDetailBloc, FilmDetailState>(
        bloc: _filmDetailBloc,
        builder: (context, state) {
          if (state is FilmDetailResponse) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FilmPosterWidget(
                        url: state.filmDetail.posterUrl as String,
                      ),
                      const SizedBox(width: 10),
                      FilmInfoWidget(filmDetail: state.filmDetail)
                    ],
                  ),
                  const SizedBox(height: 10),
                  FilmDescription(description: state.filmDetail.description),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          if (isSaved) {
            _saveFilmBloc.add(RemoveFilm(film: widget.film));
          }
          if (!isSaved) {
            _saveFilmBloc.add(SaveFilm(film: widget.film));
          }
        },
        child: BlocBuilder<CollectionFilmBloc, CollectionFilmState>(
          bloc: _saveFilmBloc,
          builder: (context, state) {
            if (state is SaveFilmRes) {
              isSaved = true;
            }
            if (state is SaveFilmReq) {
              return const CircularProgressIndicator.adaptive();
            }
            return Icon(isSaved ? Icons.bookmark_added : Icons.bookmark_add);
          },
        ),
      ),
    );
  }
}
