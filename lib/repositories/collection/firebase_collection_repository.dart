import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:poisk_kino/repositories/collection/collection.dart';
import 'package:poisk_kino/repositories/films_list/models/film_model.dart';

class FirebaseCollectionRepository extends AbstractCollectionRepository {
  User? user = FirebaseAuth.instance.currentUser;
  final ref = FirebaseDatabase.instance.ref("filmCollection");

  @override
  Future<bool> checkInCollection(filmId) async {
    final event =
        await ref.child("${user!.uid}/$filmId").once(DatabaseEventType.value);
    final snapshot = event.snapshot;

    return snapshot.exists;
  }

  @override
  Future<void> deleteFromCollection(filmId) async {
    await ref.child("${user!.uid}/$filmId").remove();
  }

  @override
  List<Film> getCollection(event) {
    List<Film> filmList = <Film>[];
    if (event.snapshot.value != null) {
      final Map<Object?, Object?> data =
          event.snapshot.value as Map<Object?, Object?>;

      Map<String, dynamic> map = Map<String, dynamic>.from(data);

      filmList = map.entries.map((e) {
        final value = Map<String, dynamic>.from(e.value);
        return Film.fromJson(value);
      }).toList();
    }

    return filmList;
  }

  @override
  Future<void> saveToCollection(Film film) async {
    await ref.child("${user!.uid}/${film.filmId}").set(film.toJson());
  }
}
