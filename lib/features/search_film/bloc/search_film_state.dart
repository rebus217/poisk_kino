part of 'search_film_bloc.dart';

abstract class SearchFilmState {}

class SearchFilmInitial extends SearchFilmState {}

class SearchFilmReq extends SearchFilmState {}

class SearchFilmReqFail extends SearchFilmState {}

class SearchFilmRes extends SearchFilmState {
  SearchFilmRes({required this.filmList});
  final List<Film> filmList;
}
