part of 'search_film_bloc.dart';

abstract class SearchFilmEvent {}

class SearchFilm extends SearchFilmEvent {
  SearchFilm({required this.keyword});

  final String keyword;
}

class SearchFilmAdd extends SearchFilmEvent{
  
}
