import 'package:poisk_kino/shared/models/models.dart';

abstract class AbstractFilmsListRepository {
  Future<FilmList> getTop(int page);
  Future<FilmDetail> getFilmDetail({required int filmId});
  Future<FilmList> searchFilm(String keyword, int page);
}
