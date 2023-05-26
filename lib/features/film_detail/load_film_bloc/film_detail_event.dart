part of 'film_detail_bloc.dart';

abstract class FilmDetailEvent {}

class FilmDetailLoad extends FilmDetailEvent {
  FilmDetailLoad({required this.filmId});

  final int filmId;
}

class FilmSave extends FilmDetailEvent {
  FilmSave({required this.film});

  final Film film;
}

class FilmRemove extends FilmDetailEvent {
  FilmRemove({required this.film});

  final Film film;
}
