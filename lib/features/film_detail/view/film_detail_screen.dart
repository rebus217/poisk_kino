import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poisk_kino/features/film_detail/bloc/film_detail_bloc.dart';
import 'package:poisk_kino/repositories/films_list/films_list.dart';

class FilmDetailsScreen extends StatefulWidget {
  const FilmDetailsScreen(
      {super.key, required this.filmName, required this.filmId});
  final String filmName;
  final int filmId;

  @override
  State<FilmDetailsScreen> createState() => _FilmDetailsScreenState();
}

class _FilmDetailsScreenState extends State<FilmDetailsScreen> {
  final FilmDetailBloc _filmDetailBloc =
      FilmDetailBloc(GetIt.I<AbstractFilmsListRepository>());

  @override
  void initState() {
    _filmDetailBloc.add(FilmDetailLoad(filmId: widget.filmId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.filmName),
      ),
      body: BlocBuilder<FilmDetailBloc, FilmDetailState>(
        bloc: _filmDetailBloc,
        builder: (context, state) {
          if (state is FilmDetailResponse) {
            return Column(
              children: [
                Image.network(state.filmDetail.posterUrl as String),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
