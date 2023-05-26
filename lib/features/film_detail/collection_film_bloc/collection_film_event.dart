part of 'collection_film_bloc.dart';

abstract class CollectionFilmEvent {}

class SaveFilm extends CollectionFilmEvent {
  SaveFilm({required this.film});
  final Film film;
}

class RemoveFilm extends CollectionFilmEvent {
  RemoveFilm({required this.film});
  final Film film;
}

class CheckFilm extends CollectionFilmEvent {
  CheckFilm({required this.filmId});

  final int filmId;
}
