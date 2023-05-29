import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poisk_kino/repositories/films_list/films_list.dart';
import 'package:poisk_kino/repositories/films_list/models/models.dart';

part 'films_list_event.dart';
part 'films_list_state.dart';

class FilmsListBloc extends Bloc<FilmsListEvent, FilmsListState> {
  FilmsListBloc(this.filmsListRepository) : super(FilmsListInitial()) {
    on<FilmsListLoad>((event, emit) async {
      try {
        emit(FilmsListRequst());
        List<Film> response = await filmsListRepository.getTop(page);
        listFilm += response;
        emit(FilmsListResponse(filmList: listFilm));
        page++;
      } catch (e) {
        emit(FilmsListRequstFail());
      }
    });
  }

  int page = 1;

  List<Film> listFilm = <Film>[];

  final AbstractFilmsListRepository filmsListRepository;
}
