import 'package:poisk_kino/repositories/films_list/models/models.dart';

abstract class AbstractFilmsListRepository {
  Future<List<Film>> getTopTen();
  Future<FilmDetail> getFilmDetail({required int filmId});
  Future<void> saveToCollection(Film film);
  Future<List<Film>> getCollection();
  Future<bool> checkInCollection(int filmId);
  Future<void> deleteFromCollection(int filmId);
  Future<List<Film>> searchFilm(String keyword);
}
