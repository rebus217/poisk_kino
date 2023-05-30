import 'package:firebase_database/firebase_database.dart';
import 'package:poisk_kino/repositories/films_list/models/models.dart';

abstract class AbstractCollectionRepository {
  Future<void> saveToCollection(Film film);
  List<Film> getCollection(event);
  Future<bool> checkInCollection(filmId);
  Future<void> deleteFromCollection(filmId);
}
