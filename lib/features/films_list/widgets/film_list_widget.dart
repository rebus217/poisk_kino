import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:poisk_kino/features/films_list/widgets/widgets.dart';
import 'package:poisk_kino/repositories/films_list/models/models.dart';
import 'package:talker_flutter/talker_flutter.dart';

class FilmListWidget extends StatefulWidget {
  const FilmListWidget({super.key, required this.filmList, this.hotLoadFilms});

  final List<Film> filmList;
  final Function? hotLoadFilms;

  @override
  State<FilmListWidget> createState() => _FilmListWidgetState();
}

class _FilmListWidgetState extends State<FilmListWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(onScrollToEndList);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(onScrollToEndList);

    super.dispose();
  }

  void onScrollToEndList() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (widget.hotLoadFilms is Function) {
        widget.hotLoadFilms!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      itemCount: widget.filmList.length,
      itemBuilder: (BuildContext context, int i) {
        final Film film = widget.filmList[i];
        return FilmTile(film: film);
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
