import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';
import 'package:poisk_kino/repositories/films_list/films_list.dart';
import 'package:poisk_kino/repositories/films_list/models/models.dart';
import 'package:talker_flutter/talker_flutter.dart';

class KinopoiskFilmListRepository extends AbstractFilmsListRepository {
  KinopoiskFilmListRepository({required this.dio});
  final Dio dio;

  @override
  void deleteFromMyCollection() {
    // TODO: implement deleteFromMyCollection
  }

  @override
  Future<FilmDetail> getFilmDetail({required int filmId}) async {
    final Response response = await dio.get("/films/$filmId");
    final Map<String, dynamic> data = response.data;
    final FilmDetail result = FilmDetail.fromJson(data);
    return result;
  }

  @override
  void getMyCollection() {
    // TODO: implement getMyCollection
  }

  @override
  Future<List<Film>> getTopTen() async {
    List<Film> filmList = <Film>[];
    try {
      final Response<dynamic> response = await dio.get("/films/top",
          queryParameters: {"type": "TOP_100_POPULAR_FILMS", "page": 1});
      final List films = response.data["films"];
      filmList = films.map((film) => Film.fromJson(film)).toList();
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
    }

    return filmList.take(10).toList();
  }

  @override
  Future<void> saveToMyCollection(Film film) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String uid = user.uid;

      DatabaseReference filmRef =
          FirebaseDatabase.instance.ref("filmCollection").child(uid);

      await filmRef.child(film.filmId.toString()).set(film.toJson());
    }
  }

  @override
  void searchFilm() {
    // TODO: implement searchFilm
  }
}
