import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poisk_kino/repositories/films_list/films_list.dart';
import 'package:poisk_kino/repositories/films_list/models/film_list_model.dart';
import 'package:poisk_kino/repositories/films_list/models/models.dart';

part 'films_list_event.dart';
part 'films_list_state.dart';

class FilmsListBloc extends Bloc<FilmsListEvent, FilmsListState> {
  FilmsListBloc(this.filmsListRepository) : super(FilmsListInitial()) {
    on<FilmsListLoad>((event, emit) async {
      try {
        emit(FilmsListRequst());
        if (maxPage != page) {
          FilmList response = await filmsListRepository.getTop(page);
          if (maxPage == 0) {
            maxPage = response.pagesCount;
          }
          listFilm += response.filmList;
          page++;
        }

        emit(FilmsListResponse(filmList: listFilm));
      } catch (e) {
        emit(FilmsListRequstFail());
      }
    });
  }

  int page = 1;
  int maxPage = 0;

  List<Film> listFilm = <Film>[];

  final AbstractFilmsListRepository filmsListRepository;
}
