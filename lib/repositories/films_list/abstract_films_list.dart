import 'package:poisk_kino/repositories/films_list/models/models.dart';

abstract class AbstractFilmsListRepository {
  Future<List<Film>> getTopTen();
  void getFilmDetail();
  void saveToMyCollection();
  void deleteFromMyCollection();
  void getMyCollection();
  void searchFilm();
}
