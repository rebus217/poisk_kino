import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poisk_kino/features/film_detail/bloc/film_detail_bloc.dart';
import 'package:poisk_kino/repositories/films_list/films_list.dart';

class FilmDetailsScreen extends StatefulWidget {
  const FilmDetailsScreen({super.key});

  @override
  State<FilmDetailsScreen> createState() => _FilmDetailsScreenState();
}

class _FilmDetailsScreenState extends State<FilmDetailsScreen> {
  final String filmName = "";
  final FilmDetailBloc _filmDetailBloc =
      FilmDetailBloc(GetIt.I<AbstractFilmsListRepository>());

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final Object? arg = ModalRoute.of(context)?.settings.arguments;
    assert(arg != null , "you must provide filmId arg");

    if (arg is int) {
      _filmDetailBloc.add(FilmDetailLoad(filmId: arg));
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Film Details"),
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
