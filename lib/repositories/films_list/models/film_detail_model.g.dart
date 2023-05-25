// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmDetail _$FilmDetailFromJson(Map<String, dynamic> json) => FilmDetail(
      nameRu: json['nameRu'] as String?,
      nameOriginal: json['nameOriginal'] as String,
      posterUrl: json['posterUrl'] as String?,
      coverUrl: json['coverUrl'] as String?,
      ratingKinopoisk: (json['ratingKinopoisk'] as num?)?.toDouble(),
      ratingImdb: (json['ratingImdb'] as num?)?.toDouble(),
      year: json['year'] as int?,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
    );

Map<String, dynamic> _$FilmDetailToJson(FilmDetail instance) =>
    <String, dynamic>{
      'nameRu': instance.nameRu,
      'nameOriginal': instance.nameOriginal,
      'posterUrl': instance.posterUrl,
      'coverUrl': instance.coverUrl,
      'ratingKinopoisk': instance.ratingKinopoisk,
      'ratingImdb': instance.ratingImdb,
      'year': instance.year,
      'genres': instance.genres,
    };
