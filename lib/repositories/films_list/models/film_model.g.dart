// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Film _$FilmFromJson(Map<String, dynamic> json) => Film(
      nameRu: json['nameRu'] as String,
      year: json['year'] as String,
      posterUrlPreview: json['posterUrlPreview'] as String,
      filmId: json['filmId'] as int,
    );

Map<String, dynamic> _$FilmToJson(Film instance) => <String, dynamic>{
      'nameRu': instance.nameRu,
      'year': instance.year,
      'posterUrlPreview': instance.posterUrlPreview,
      'filmId': instance.filmId,
    };
