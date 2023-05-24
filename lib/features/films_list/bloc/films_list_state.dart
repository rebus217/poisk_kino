part of 'films_list_bloc.dart';

abstract class FilmsListState {}

class FilmsListInitial extends FilmsListState {}

class FilmsListRequst extends FilmsListState {}

class FilmsListResponse extends FilmsListState {}

class FilmsListRequstFail extends FilmsListState {}
