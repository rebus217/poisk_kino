import 'package:poisk_kino/repositories/films_list/models/models.dart';

abstract class AbstractFilmsListRepository {
  Future<List<Film>> getTopTen();
  Future<FilmDetail> getFilmDetail({required int filmId});
  void saveToMyCollection();
  void deleteFromMyCollection();
  void getMyCollection();
  void searchFilm();
}
