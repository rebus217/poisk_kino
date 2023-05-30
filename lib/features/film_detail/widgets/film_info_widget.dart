import 'package:flutter/material.dart';
import 'package:poisk_kino/shared/models/models.dart';

class FilmInfoWidget extends StatelessWidget {
  const FilmInfoWidget({super.key, required this.filmDetail});
  final FilmDetail filmDetail;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "${filmDetail.nameRu ?? "-"} (${filmDetail.year ?? "-"})",
            style: textTheme.titleLarge,
          ),
          Text(
            filmDetail.nameOriginal ?? "-",
            style: textTheme.titleMedium,
          ),
          const SizedBox(height: 30),
          Text(
            "Country:  ${filmDetail.countries}",
          ),
          const SizedBox(height: 6),
          Text(
            "Gener:  ${filmDetail.genres}",
          ),
          const SizedBox(height: 6),
          Text(
            "Slogan:  ${filmDetail.slogan ?? "-"}",
          ),
          const SizedBox(height: 6),
          Text(
            "Kinopoisk raiting:  ${filmDetail.ratingKinopoisk ?? "-"}",
          ),
          const SizedBox(height: 6),
          Text(
            "Imdb raiting:  ${filmDetail.ratingImdb ?? "-"}",
          ),
        ],
      ),
    );
  }
}
