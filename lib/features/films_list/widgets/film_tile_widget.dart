import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poisk_kino/shared/models/models.dart';

class FilmTile extends StatelessWidget {
  const FilmTile({super.key, required this.film});

  final Film film;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final listTileTheme = theme.listTileTheme;
    return ListTile(
      leading: Image.network(film.posterUrlPreview),
      title: Text(
        film.nameRu ?? film.nameEn ?? "-",
      ),
      subtitle: Text(
        film.year ?? "-",
        style: listTileTheme.subtitleTextStyle,
      ),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () => context.pushNamed("film", extra: film),
    );
  }
}
