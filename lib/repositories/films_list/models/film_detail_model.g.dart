// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmDetail _$FilmDetailFromJson(Map<String, dynamic> json) => FilmDetail(
      nameRu: json['nameRu'] as String?,
      nameOriginal: json['nameOriginal'] as String,
      posterUrl: json['posterUrl'] as String?,
      posterUrlPreview: json['posterUrlPreview'] as String?,
      coverUrl: json['coverUrl'] as String?,
      ratingKinopoisk: (json['ratingKinopoisk'] as num?)?.toDouble(),
      ratingImdb: (json['ratingImdb'] as num?)?.toDouble(),
      year: json['year'] as int?,
      countries: FilmDetail._countryFromJson(json['countries'] as List),
      genres: FilmDetail._generesFromJson(json['genres'] as List),
    );

Map<String, dynamic> _$FilmDetailToJson(FilmDetail instance) =>
    <String, dynamic>{
      'nameRu': instance.nameRu,
      'nameOriginal': instance.nameOriginal,
      'posterUrl': instance.posterUrl,
      'posterUrlPreview': instance.posterUrlPreview,
      'coverUrl': instance.coverUrl,
      'ratingKinopoisk': instance.ratingKinopoisk,
      'ratingImdb': instance.ratingImdb,
      'year': instance.year,
      'countries': FilmDetail._countryToJson(instance.countries),
      'genres': FilmDetail._generesToJson(instance.genres),
    };
