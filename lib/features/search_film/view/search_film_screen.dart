import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poisk_kino/features/films_list/widgets/widgets.dart';
import 'package:poisk_kino/features/search_film/bloc/search_film_bloc.dart';
import 'package:poisk_kino/features/try_again/try_again.dart';
import 'package:poisk_kino/repositories/films_list/films_list.dart';
import 'package:poisk_kino/shared/models/models.dart';

class SearchFilmScreen extends StatefulWidget {
  const SearchFilmScreen({super.key});

  @override
  State<SearchFilmScreen> createState() => _SearchFilmScreenState();
}

class _SearchFilmScreenState extends State<SearchFilmScreen> {
  final SearchFilmBloc _searchFilmBloc =
      SearchFilmBloc(GetIt.I<AbstractFilmsListRepository>());

  List<Film> filmList = <Film>[];
  bool isLast = true;

  var searchController = TextEditingController();

  void _onSearch() {
    String keyword = searchController.text;
    if (keyword.isNotEmpty) {
      _searchFilmBloc.add(SearchFilm(keyword: keyword));
    }
  }

  void _onClear() {
    searchController.clear();
    _searchFilmBloc.add(SearchFilm(keyword: ''));
  }

  onAdd() {
    _searchFilmBloc.add(SearchFilmAdd());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Film"),
      ),
      body: BlocBuilder<SearchFilmBloc, SearchFilmState>(
        bloc: _searchFilmBloc,
        builder: (context, state) {
          if (state is SearchFilmReq) {}
          if (state is SearchFilmRes) {
            filmList = state.filmList;
            isLast = state.isLast;
          }
          if (state is SearchFilmReqFail) {
            return TryAgainWidget(onTrayAgain: _onSearch);
          }

          return Column(
            children: [
              TextField(
                autofocus: true,
                controller: searchController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  prefix: IconButton(
                    onPressed: _onSearch,
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                  suffix: IconButton(
                    onPressed: _onClear,
                    icon: const Icon(
                      Icons.clear,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FilmListWidget(
                  filmList: filmList,
                  hotLoadFilms: onAdd,
                  isLast: isLast,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
