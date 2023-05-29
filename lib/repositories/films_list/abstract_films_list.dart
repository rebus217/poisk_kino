import 'package:firebase_database/firebase_database.dart';
import 'package:poisk_kino/repositories/films_list/models/film_list_model.dart';
import 'package:poisk_kino/repositories/films_list/models/models.dart';

abstract class AbstractFilmsListRepository {
  Future<FilmList> getTop(int page);
  Future<FilmDetail> getFilmDetail({required int filmId});
  Future<void> saveToCollection(Film film);
  List<Film> getCollection(DatabaseEvent event);
  Future<bool> checkInCollection(int filmId);
  Future<void> deleteFromCollection(int filmId);
  Future<FilmList> searchFilm(String keyword, int page);
}
