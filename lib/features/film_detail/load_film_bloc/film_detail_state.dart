part of 'film_detail_bloc.dart';

abstract class FilmDetailState {}

class FilmDetailInitial extends FilmDetailState {}

class FilmDetailRequest extends FilmDetailState {}

class FilmDetailRequestFail extends FilmDetailState {}

class FilmDetailResponse extends FilmDetailState {
  FilmDetailResponse({required this.filmDetail});
  final FilmDetail filmDetail;
}

class FilmSaveReq extends FilmDetailState {}

class FilmSaveReqFail extends FilmDetailState {}

class FilmSaveRes extends FilmDetailState {}
