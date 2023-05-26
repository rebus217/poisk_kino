import 'package:firebase_database/firebase_database.dart';
import 'package:poisk_kino/repositories/films_list/models/models.dart';

abstract class AbstractFilmsListRepository {
  Future<List<Film>> getTopTen();
  Future<FilmDetail> getFilmDetail({required int filmId});
  Future<void> saveToMyCollection(Film film);
  void deleteFromMyCollection();
  List<Film> getMyCollection(DatabaseEvent event);
  void searchFilm();
}
