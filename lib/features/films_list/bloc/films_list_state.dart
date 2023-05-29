part of 'films_list_bloc.dart';

abstract class FilmsListState {}

class FilmsListInitial extends FilmsListState {}

class FilmsListRequst extends FilmsListState {}

class FilmsListResponse extends FilmsListState {
  FilmsListResponse({
    required this.filmList,
    required this.isLast,
  });
  final List<Film> filmList;
  final bool isLast;
}

class FilmsListRequstFail extends FilmsListState {}
