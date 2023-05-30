import 'package:flutter/material.dart';
import 'package:poisk_kino/features/films_list/widgets/widgets.dart';
import 'package:poisk_kino/shared/models/models.dart';

class FilmListWidget extends StatefulWidget {
  const FilmListWidget(
      {super.key,
      required this.filmList,
      this.hotLoadFilms,
      required this.isLast});

  final List<Film> filmList;
  final Function? hotLoadFilms;
  final bool isLast;

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
    int itemCount =
        widget.isLast ? widget.filmList.length : widget.filmList.length + 1;
    return ListView.separated(
      controller: _scrollController,
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int i) {
        if (i == widget.filmList.length && !widget.isLast) {
          return const SizedBox(
            height: 40,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        final Film film = widget.filmList[i];
        return FilmTile(film: film);
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
