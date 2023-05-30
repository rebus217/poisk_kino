import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poisk_kino/repositories/collection/collection.dart';
import 'package:poisk_kino/shared/models/models.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'film_collection_event.dart';
part 'film_collection_state.dart';

class FilmCollectionListBloc
    extends Bloc<FilmCollectionListEvent, FilmCollectionListState> {
  FilmCollectionListBloc() : super(FilmCollectionInitial()) {
    on<LoadFilmCollection>((event, emit) async {
      try {
        DatabaseReference filmRef =
            FirebaseDatabase.instance.ref("filmCollection/${user!.uid}");

        await emit.forEach(filmRef.onValue, onData: (data) {
          List<Film> filmList = _collectionRepository.getCollection(data);
          return FilmCollectionRes(filmList: filmList);
        });
      } catch (e, st) {
        GetIt.I<Talker>().handle(e, st);
        emit(FilmCollectionReqFail());
      }
      return;
    });
  }

  final AbstractCollectionRepository _collectionRepository =
      FirebaseCollectionRepository();
  User? user = FirebaseAuth.instance.currentUser;
}
