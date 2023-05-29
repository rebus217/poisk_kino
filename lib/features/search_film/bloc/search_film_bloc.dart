import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poisk_kino/repositories/films_list/films_list.dart';
import 'package:poisk_kino/repositories/films_list/models/models.dart';

part 'search_film_event.dart';
part 'search_film_state.dart';

class SearchFilmBloc extends Bloc<SearchFilmEvent, SearchFilmState> {
  SearchFilmBloc(this._filmsListRepository) : super(SearchFilmInitial()) {
    on<SearchFilm>((event, emit) async {
      try {
        emit(SearchFilmReq());
        if (event.keyword.isNotEmpty) {
          List<Film> filmList =
              await _filmsListRepository.searchFilm(event.keyword);
          emit(SearchFilmRes(filmList: filmList));
          return;
        }
        emit(SearchFilmRes(filmList: <Film>[]));
      } catch (e) {
        emit(SearchFilmReqFail());
      }
    });
  }
  final AbstractFilmsListRepository _filmsListRepository;
}
