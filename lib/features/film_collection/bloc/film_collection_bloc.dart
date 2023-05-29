import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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
        User? user = FirebaseAuth.instance.currentUser;
        DatabaseReference filmRef =
            FirebaseDatabase.instance.ref("filmCollection/${user!.uid}");
        await emit.forEach(filmRef.onValue, onData: (data) {
          List<Film> filmList = _filmsListRepository.getCollection(data);
          return FilmCollectionRes(filmList: filmList);
        });
      } catch (e, st) {
        GetIt.I<Talker>().handle(e, st);
        emit(FilmCollectionReqFail());
      }
      return;
    });
  }

  final AbstractFilmsListRepository _filmsListRepository;
}
