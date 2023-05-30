import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poisk_kino/repositories/films_list/films_list.dart';
import 'package:poisk_kino/shared/models/models.dart';

part 'search_film_event.dart';
part 'search_film_state.dart';

class SearchFilmBloc extends Bloc<SearchFilmEvent, SearchFilmState> {
  SearchFilmBloc(this._filmsListRepository) : super(SearchFilmInitial()) {
    on<SearchFilm>((event, emit) async {
      try {
        emit(SearchFilmReq());
        page = 1;
        keyword = event.keyword;
        maxPage = 0;
        listFilm = <Film>[];
        isLast = true;

        if (event.keyword.isEmpty) {
          emit(SearchFilmRes(filmList: listFilm, isLast: isLast));
          return;
        }

        FilmList result = await _filmsListRepository.searchFilm(keyword, page);
        maxPage = result.pagesCount;
        listFilm = result.filmList;
        page++;
        isLast = page > maxPage;
        emit(SearchFilmRes(filmList: listFilm, isLast: isLast));
      } catch (e) {
        emit(SearchFilmReqFail());
      }
    });
    on<SearchFilmAdd>((event, emit) async {
      try {
        if (isLast) {
          return;
        }
        emit(SearchFilmReq());
        FilmList result = await _filmsListRepository.searchFilm(keyword, page);
        page++;
        listFilm += result.filmList;
        isLast = page > maxPage;
        emit(SearchFilmRes(filmList: listFilm, isLast: isLast));
      } catch (e) {
        emit(SearchFilmReqFail());
      }
    });
  }

  int page = 1;
  int maxPage = 0;
  String keyword = "";
  bool isLast = true;

  List<Film> listFilm = <Film>[];

  final AbstractFilmsListRepository _filmsListRepository;
}
