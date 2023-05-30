part of 'film_collection_bloc.dart';

abstract class FilmCollectionListState {}

class FilmCollectionInitial extends FilmCollectionListState {}

class FilmCollectionReq extends FilmCollectionListState {}

class FilmCollectionReqFail extends FilmCollectionListState {}

class FilmCollectionRes extends FilmCollectionListState {
  FilmCollectionRes({required this.filmList});

  final List<Film> filmList;
}
