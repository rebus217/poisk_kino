part of 'film_detail_bloc.dart';

abstract class FilmDetailEvent {}

class FilmDetailLoad extends FilmDetailEvent {
  FilmDetailLoad({required this.filmId});

  final int filmId;
}
