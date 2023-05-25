import 'package:flutter/material.dart';
import 'package:poisk_kino/repositories/films_list/models/models.dart';

class FilmInfoWidget extends StatelessWidget {
  const FilmInfoWidget({super.key, required this.filmDetail});
  final FilmDetail filmDetail;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //TODO: Craete TextTheme
          Text(
            "${filmDetail.nameRu ?? "-"} (${filmDetail.year ?? "-"})",
          ),
          Text(filmDetail.nameOriginal),
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
