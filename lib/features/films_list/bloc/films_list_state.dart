part of 'films_list_bloc.dart';

abstract class FilmsListState {}

class FilmsListInitial extends FilmsListState {}

class FilmsListRequst extends FilmsListState {}

class FilmsListResponse extends FilmsListState {
  FilmsListResponse({required this.filmList});
  final List<Film> filmList;
}

class FilmsListRequstFail extends FilmsListState {}
