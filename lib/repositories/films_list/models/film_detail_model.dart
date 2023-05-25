import 'package:json_annotation/json_annotation.dart';

part 'film_detail_model.g.dart';

@JsonSerializable()
class FilmDetail {
  FilmDetail({
    this.nameRu,
    required this.nameOriginal,
    required this.posterUrl,
    required this.posterUrlPreview,
    required this.coverUrl,
    required this.ratingKinopoisk,
    required this.ratingImdb,
    required this.year,
    required this.countries,
    required this.genres,
  });

  final String? nameRu;
  final String nameOriginal;
  final String? posterUrl;
  final String? posterUrlPreview;
  final String? coverUrl;
  final double? ratingKinopoisk;
  final double? ratingImdb;
  final int? year;
  @JsonKey(
    toJson: _countryToJson,
    fromJson: _countryFromJson,
  )
  final String countries;

  @JsonKey(
    toJson: _generesToJson,
    fromJson: _generesFromJson,
  )
  final String genres;

  factory FilmDetail.fromJson(Map<String, dynamic> json) =>
      _$FilmDetailFromJson(json);

  Map<String, dynamic> toJson() => _$FilmDetailToJson(this);

  static _countryToJson(String country) {}
  static String _countryFromJson(List<dynamic> countryList) {
    final List countryNameList = countryList.map((country) {
      final String countryName = country["country"];
      return countryName;
    }).toList();
    return countryNameList.join(", ");
  }

  static _generesToJson(String gener) {}
  static String _generesFromJson(List<dynamic> generList) {
    final List generNameList = generList.map((genere) {
      final String generName = genere["genre"];
      return generName;
    }).toList();
    return generNameList.join(", ");
  }
}
