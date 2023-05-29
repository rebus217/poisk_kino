import 'package:poisk_kino/repositories/films_list/models/models.dart';

class FilmList {
  FilmList({required this.filmList, required this.pagesCount});

  final List<Film> filmList;
  final int pagesCount;
}
