import 'package:json_annotation/json_annotation.dart';

part 'film_model.g.dart';

@JsonSerializable()
class Film {
  Film({
    required this.nameRu,
    required this.year,
    required this.posterUrlPreview,
    required this.filmId,
  });

  final String nameRu;
  final String year;
  final String posterUrlPreview;
  final int filmId;

  factory Film.fromJson(Map<String, dynamic> json) => _$FilmFromJson(json);

  Map<String, dynamic> toJson() => _$FilmToJson(this);
}
