part of 'film_collection_bloc.dart';

abstract class FilmCollectionState {}

class FilmCollectionInitial extends FilmCollectionState {}

class FilmCollectionReq extends FilmCollectionState {}

class FilmCollectionReqFail extends FilmCollectionState {}

class FilmCollectionRes extends FilmCollectionState {
  FilmCollectionRes({required this.filmList});

  final List<Film> filmList;
}
