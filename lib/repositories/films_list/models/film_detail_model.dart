import 'package:json_annotation/json_annotation.dart';

part 'film_detail_model.g.dart';

@JsonSerializable()
class FilmDetail {
  FilmDetail({
    required this.nameRu,
    required this.nameOriginal,
    required this.posterUrl,
    required this.coverUrl,
    required this.ratingKinopoisk,
    required this.ratingImdb,
    required this.year,
    // required this.country,
    required this.genres,
  });

  final String? nameRu;
  final String nameOriginal;
  final String? posterUrl;
  final String? coverUrl;
  final double? ratingKinopoisk;
  final double? ratingImdb;
  final int? year;
  // final String? country;
  final List<Map<String, String>> genres;

  factory FilmDetail.fromJson(Map<String, dynamic> json) =>
      _$FilmDetailFromJson(json);

  Map<String, dynamic> toJson() => _$FilmDetailToJson(this);
}
