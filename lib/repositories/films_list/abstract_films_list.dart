import 'package:poisk_kino/repositories/films_list/models/models.dart';

abstract class AbstractFilmsListRepository {
  Future<FilmList> getTop(int page);
  Future<FilmDetail> getFilmDetail({required int filmId});
  Future<FilmList> searchFilm(String keyword, int page);
}
