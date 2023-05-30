import 'package:json_annotation/json_annotation.dart';

part 'film_model.g.dart';

@JsonSerializable()
class Film {
  Film({
    this.nameRu,
    this.nameEn,
    this.year,
    required this.posterUrlPreview,
    required this.filmId,
  });

  final String? nameRu;
  final String? nameEn;
  final String? year;
  final String posterUrlPreview;

  final int filmId;

  factory Film.fromJson(Map<String, dynamic> json) {
    json.putIfAbsent("filmId", () => json['kinopoiskId']);
    json["year"] = json["year"].toString();
    return _$FilmFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FilmToJson(this);
}
