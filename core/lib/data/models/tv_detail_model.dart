import 'package:core/data/models/season_model.dart';
import 'package:core/domain/entities/tv_detail.dart';
import 'package:equatable/equatable.dart';

import 'genre_model.dart';

class TvDetailResponse extends Equatable {
  const TvDetailResponse({
    required this.backdropPath,
    required this.numberOfEpisodes,
    required this.genres,
    required this.homepage,
    required this.originCountry,
    required this.id,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.seasons,
    required this.firstAirDate,
    required this.numberOfSeasons,
    required this.episodeRuntime,
    required this.status,
    required this.tagline,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  final String? backdropPath;
  final int numberOfEpisodes;
  final List<GenreModel> genres;
  final String homepage;
  final List<String> originCountry;
  final int id;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<SeasonModel> seasons;
  final String firstAirDate;
  final int numberOfSeasons;
  final List<int> episodeRuntime;
  final String status;
  final String tagline;
  final String name;
  final double voteAverage;
  final int voteCount;

  factory TvDetailResponse.fromJson(Map<String, dynamic> json) =>
      TvDetailResponse(
        backdropPath: json["backdrop_path"],
        numberOfEpisodes: json["number_of_episodes"],
        genres: List<GenreModel>.from(
          json["genres"].map(
            (x) => GenreModel.fromJson(x),
          ),
        ),
        homepage: json["homepage"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        seasons: List<SeasonModel>.from((json["seasons"] as List)
            .map((x) => SeasonModel.fromJson(x))
            .where((element) =>
                element.posterPath != null && element.airDate != null)),
        firstAirDate: json["first_air_date"],
        numberOfSeasons: json["number_of_seasons"],
        episodeRuntime: List<int>.from(json["episode_run_time"].map((x) => x)),
        status: json["status"],
        tagline: json["tagline"],
        name: json["name"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "number_of_episodes": numberOfEpisodes,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
        "first_air_date": firstAirDate,
        "number_of_seasons": numberOfSeasons,
        "episode_run_time": List<dynamic>.from(episodeRuntime.map((x) => x)),
        "status": status,
        "tagline": tagline,
        "name": name,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  TvDetail toEntity() => TvDetail(
        backdropPath: backdropPath,
        genres: genres.map((genre) => genre.toEntity()).toList(),
        id: id,
        originalName: originalName,
        overview: overview,
        posterPath: posterPath,
        seasons: seasons.map((season) => season.toEntity()).toList(),
        firstAirDate: firstAirDate,
        episodeRuntime: episodeRuntime,
        name: name,
        voteAverage: voteAverage,
        voteCount: voteCount,
        numberOfSeasons: numberOfSeasons,
        numberOfEpisodes: numberOfEpisodes,
      );

  @override
  List<Object?> get props => [
        backdropPath,
        numberOfSeasons,
        genres,
        originCountry,
        id,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        seasons,
        firstAirDate,
        numberOfSeasons,
        episodeRuntime,
        status,
        tagline,
        name,
        voteAverage,
        voteCount,
      ];
}
