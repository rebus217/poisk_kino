import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poisk_kino/features/films_list/widgets/widgets.dart';
import 'package:poisk_kino/repositories/films_list/models/models.dart';

class FilmListWidget extends StatelessWidget {
  const FilmListWidget({super.key, required this.filmList});

  final List<Film> filmList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: filmList.length,
      itemBuilder: (BuildContext context, int i) {
        final Film film = filmList[i];
        return FilmTile(film: film);
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
