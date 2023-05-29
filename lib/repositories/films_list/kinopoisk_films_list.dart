import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';
import 'package:poisk_kino/repositories/films_list/films_list.dart';
import 'package:poisk_kino/repositories/films_list/models/film_list_model.dart';
import 'package:poisk_kino/repositories/films_list/models/models.dart';
import 'package:talker_flutter/talker_flutter.dart';

class KinopoiskFilmListRepository extends AbstractFilmsListRepository {
  KinopoiskFilmListRepository({required this.dio});
  final Dio dio;

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Future<FilmDetail> getFilmDetail({required int filmId}) async {
    final Response response = await dio.get("/films/$filmId");
    final Map<String, dynamic> data = response.data;
    final FilmDetail result = FilmDetail.fromJson(data);
    return result;
  }

  @override
  Future<List<Film>> searchFilm(String keyword) async {
    List<Film> result = <Film>[];

    try {
      final Response response = await dio.get("/films", queryParameters: {
        "keyword": keyword,
        "order": "RATING",
        "type": "FILM",
      });
      final Map<String, dynamic> data = response.data;

      List<dynamic> rawList = data["items"];
      result = rawList.map((elem) {
        return Film.fromJson(elem);
      }).toList();
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
    }

    return result;
  }

  @override
  Future<FilmList> getTop(int page) async {
    List<Film> filmList = <Film>[];
    int pageCount = 0;
    try {
      final Response<dynamic> response = await dio.get("/films/top",
          queryParameters: {"type": "TOP_100_POPULAR_FILMS", "page": page});
      final List films = response.data["films"];
      pageCount = response.data["pagesCount"];
      filmList = films.map((film) => Film.fromJson(film)).toList();
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
    }

    return FilmList(filmList: filmList, pagesCount: pageCount);
  }

  @override
  Future<List<Film>> getCollection() async {
    final ref = FirebaseDatabase.instance.ref("filmCollection/${user!.uid}");
    final snapshot = await ref.get();
    List<Film> filmList = <Film>[];
    if (snapshot.value != null) {
      final Map<Object?, Object?> data =
          snapshot.value as Map<Object?, Object?>;

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
    final ref = FirebaseDatabase.instance.ref("filmCollection");
    await ref.child("${user!.uid}/${film.filmId}").set(film.toJson());
  }

  @override
  Future<bool> checkInCollection(int filmId) async {
    final ref = FirebaseDatabase.instance.ref();

    final snapshot = await ref
        .child("filmCollection")
        .child(user!.uid)
        .child("$filmId")
        .get();

    return snapshot.exists;
  }

  @override
  Future<void> deleteFromCollection(int filmId) async {
    final ref = FirebaseDatabase.instance.ref("filmCollection");

    await ref.child("${user!.uid}/$filmId").remove();
  }
}
