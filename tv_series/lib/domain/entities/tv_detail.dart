import 'package:core/domain/entities/genre.dart';
import 'package:equatable/equatable.dart';
import 'season.dart';

class TvDetail extends Equatable {
  const TvDetail({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.originalName,
    required this.numberOfSeasons,
    required this.numberOfEpisodes,
    required this.overview,
    required this.posterPath,
    required this.seasons,
    required this.firstAirDate,
    required this.episodeRuntime,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  final String? backdropPath;
  final List<Genre> genres;
  final int id;
  final String originalName;
  final String overview;
  final String posterPath;
  final List<Season> seasons;
  final String firstAirDate;
  final List<int> episodeRuntime;
  final int numberOfSeasons;
  final int numberOfEpisodes;
  final String name;
  final double voteAverage;
  final int voteCount;

  @override
  List<Object?> get props => [
        backdropPath,
        genres,
        id,
        originalName,
        overview,
        posterPath,
        seasons,
        firstAirDate,
        name,
        voteAverage,
        voteCount,
      ];
}
