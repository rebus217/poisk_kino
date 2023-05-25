import 'package:flutter/material.dart';
import 'package:poisk_kino/repositories/films_list/models/film_model.dart';

class FilmTile extends StatelessWidget {
  const FilmTile({super.key, required this.film});

  final Film film;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(film.posterUrlPreview),
      title: Text(film.nameRu),
      subtitle: Text(film.year),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () => Navigator.of(context).pushNamed("/film"),
    );
  }
}
