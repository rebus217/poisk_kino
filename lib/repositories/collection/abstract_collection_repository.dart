import 'package:poisk_kino/shared/models/models.dart';

abstract class AbstractCollectionRepository {
  Future<void> saveToCollection(Film film);
  List<Film> getCollection(event);
  Future<bool> checkInCollection(filmId);
  Future<void> deleteFromCollection(filmId);
}
