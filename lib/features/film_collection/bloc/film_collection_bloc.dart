import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poisk_kino/repositories/films_list/films_list.dart';
import 'package:poisk_kino/repositories/films_list/models/models.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'film_collection_event.dart';
part 'film_collection_state.dart';

class FilmCollectionBloc
    extends Bloc<FilmCollectionEvent, FilmCollectionState> {
  FilmCollectionBloc(this._filmsListRepository)
      : super(FilmCollectionInitial()) {
    on<LoadFilmCollection>((event, emit) async {
      try {
        emit(FilmCollectionReq());
        List<Film> filmList = await _filmsListRepository.getCollection();
        emit(FilmCollectionRes(filmList: filmList));
      } catch (e, st) {
        GetIt.I<Talker>().handle(e, st);
        emit(FilmCollectionReqFail());
      }
    });
  }

  final AbstractFilmsListRepository _filmsListRepository;
}
