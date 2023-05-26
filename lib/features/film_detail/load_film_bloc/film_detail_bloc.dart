import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poisk_kino/repositories/films_list/films_list.dart';
import 'package:poisk_kino/repositories/films_list/models/models.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'film_detail_event.dart';
part 'film_detail_state.dart';

class FilmDetailBloc extends Bloc<FilmDetailEvent, FilmDetailState> {
  FilmDetailBloc(this.filmsListRepository) : super(FilmDetailInitial()) {
    on<FilmDetailLoad>((event, emit) async {
      try {
        emit(FilmDetailRequest());
        final filmDetail =
            await filmsListRepository.getFilmDetail(filmId: event.filmId);
        emit(FilmDetailResponse(filmDetail: filmDetail));
      } catch (e, st) {
        GetIt.I<Talker>().handle(e, st);
        emit(FilmDetailRequestFail());
      }
    });
    on<FilmSave>((event, emit) async {
      try {
        emit(FilmSaveReq());
        await filmsListRepository.saveToCollection(event.film);
        emit(FilmSaveRes());
      } catch (e, st) {
        emit(FilmSaveReqFail());
        GetIt.I<Talker>().handle(e, st);
      }
    });
  }
  final AbstractFilmsListRepository filmsListRepository;
}
