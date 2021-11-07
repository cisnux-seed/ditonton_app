import 'package:core/domain/entities/tv.dart';
import 'package:equatable/equatable.dart';

class TvModel extends Equatable {
  const TvModel({
    required this.originalLanguage,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.originCountry,
    required this.voteAverage,
    required this.voteCount,
  });

  final String originalLanguage;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalName;
  final String overview;
  final double popularity;
  final String? posterPath;
  final String? firstAirDate;
  final String name;
  final List<String> originCountry;
  final double voteAverage;
  final int voteCount;

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
        originalLanguage: json["original_language"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        firstAirDate: json["first_air_date"],
        name: json["name"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "original_language": originalLanguage,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "first_air_date": firstAirDate,
        "name": name,
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  Tv toEntity() => Tv(
        originalLanguage: originalLanguage,
        backdropPath: backdropPath,
        genreIds: genreIds,
        id: id,
        originalName: originalName,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        firstAirDate: firstAirDate,
        name: name,
        originCountry: originCountry,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );

  @override
  List<Object?> get props => [
        originalLanguage,
        backdropPath,
        genreIds,
        id,
        originalName,
        overview,
        popularity,
        posterPath,
        firstAirDate,
        name,
        originCountry,
        voteAverage,
        voteCount,
      ];
}
