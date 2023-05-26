import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poisk_kino/repositories/films_list/films_list.dart';
import 'package:poisk_kino/repositories/films_list/models/models.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'collection_film_event.dart';
part 'collection_film_state.dart';

class CollectionFilmBloc
    extends Bloc<CollectionFilmEvent, CollectionFilmState> {
  CollectionFilmBloc(this._filmsListRepository) : super(SaveFilmInitial()) {
    on<SaveFilm>((event, emit) async {
      try {
        emit(SaveFilmReq());
        await _filmsListRepository.saveToMyCollection(event.film);
        emit(SaveFilmRes());
      } catch (e, st) {
        emit(SaveFilmReqFail());
        GetIt.I<Talker>().handle(e, st);
      }
    });
  }
  final AbstractFilmsListRepository _filmsListRepository;
}
