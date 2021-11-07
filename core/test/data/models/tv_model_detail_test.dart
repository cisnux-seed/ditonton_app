import 'package:core/data/models/genre_model.dart';
import 'package:core/data/models/season_model.dart';
import 'package:core/data/models/tv_detail_model.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:core/domain/entities/season.dart';
import 'package:core/domain/entities/tv_detail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tTvDetailResponseModel = TvDetailResponse(
    backdropPath: "/path.jpg",
    id: 1,
    overview: "overview",
    popularity: 1.0,
    posterPath: "/path.jpg",
    seasons: [
      SeasonModel(
        airDate: "2021-06-12",
        episodeCount: 1,
        id: 1,
        name: "name",
        overview: "overview",
        posterPath: "/path.jpg",
        seasonNumber: 1,
      ),
    ],
    voteAverage: 1.0,
    voteCount: 1,
    episodeRuntime: [32, 23],
    firstAirDate: "2021-06-12",
    genres: [
      GenreModel(id: 99, name: "Documentary"),
    ],
    homepage: "homepage",
    name: "name",
    numberOfEpisodes: 1,
    numberOfSeasons: 1,
    originalLanguage: "en",
    originalName: "original name",
    originCountry: ["US"],
    status: "status",
    tagline: "tagline",
  );

  final tTv = TvDetail(
    backdropPath: "/path.jpg",
    episodeRuntime: const [32, 23],
    firstAirDate: '2021-06-12',
    genres: [
      Genre(id: 99, name: "Documentary"),
    ],
    id: 1,
    name: 'name',
    numberOfEpisodes: 1,
    numberOfSeasons: 1,
    originalName: 'original name',
    overview: 'overview',
    posterPath: '/path.jpg',
    seasons: [
      Season(
        airDate: "2021-06-12",
        episodeCount: 1,
        id: 1,
        name: "name",
        overview: "overview",
        posterPath: "/path.jpg",
        seasonNumber: 1,
      ),
    ],
    voteAverage: 1,
    voteCount: 1,
  );

  test('should be a subclass of Tv entity', () async {
    final result = tTvDetailResponseModel.toEntity();
    expect(result, tTv);
  });
}
