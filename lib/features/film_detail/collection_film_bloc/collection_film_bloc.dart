import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poisk_kino/repositories/collection/collection.dart';
import 'package:poisk_kino/repositories/films_list/films_list.dart';
import 'package:poisk_kino/repositories/films_list/models/models.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'collection_film_event.dart';
part 'collection_film_state.dart';

class CollectionFilmBloc
    extends Bloc<CollectionFilmEvent, CollectionFilmState> {
  CollectionFilmBloc() : super(SaveFilmInitial()) {
    on<SaveFilm>((event, emit) async {
      try {
        emit(SaveFilmReq());
        await _collectionRepository.saveToCollection(event.film);
        emit(SaveFilmRes(isSaved: true));
      } catch (e, st) {
        emit(SaveFilmReqFail());
        GetIt.I<Talker>().handle(e, st);
      }
    });
    on<CheckFilm>((event, emit) async {
      try {
        emit(SaveFilmReq());
        final bool isSaved =
            await _collectionRepository.checkInCollection(event.filmId);
        emit(SaveFilmRes(isSaved: isSaved));
      } catch (e, st) {
        emit(SaveFilmReqFail());
        GetIt.I<Talker>().handle(e, st);
      }
    });
    on<RemoveFilm>((event, emit) async {
      try {
        emit(SaveFilmReq());
        await _collectionRepository.deleteFromCollection(event.film.filmId);
        emit(SaveFilmRes(isSaved: false));
      } catch (e, st) {
        emit(SaveFilmReqFail());
        GetIt.I<Talker>().handle(e, st);
      }
    });
  }

  final AbstractCollectionRepository _collectionRepository =
      FirebaseCollectionRepository();
}
