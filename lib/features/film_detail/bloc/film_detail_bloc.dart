import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poisk_kino/repositories/films_list/films_list.dart';
import 'package:poisk_kino/repositories/films_list/models/models.dart';

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
      } catch (e) {
        emit(FilmDetailRequestFail());
      }
    });
  }
  final AbstractFilmsListRepository filmsListRepository;
}
