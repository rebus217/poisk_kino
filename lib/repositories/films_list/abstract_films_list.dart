import 'package:poisk_kino/repositories/films_list/models/models.dart';

abstract class AbstractFilmsListRepository {
  Future<List<Film>> getTopTen();
  Future<FilmDetail> getFilmDetail({required int filmId});
  Future<void> saveToMyCollection(Film film);
  void deleteFromMyCollection();
  void getMyCollection();
  void searchFilm();
}
