import 'package:core/data/models/genre_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/data/models/season_model.dart';
import 'package:tv_series/data/models/tv_detail_model.dart';
import '../../json_reader.dart';
import 'dart:convert';

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

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/tv_detail.json'));
      // act
      final result = TvDetailResponse.fromJson(jsonMap);

      // assert
      expect(result, tTvDetailResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange
      // act
      final result = tTvDetailResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "backdrop_path": "/path.jpg",
        "id": 1,
        "overview": "overview",
        "popularity": 1.0,
        "poster_path": "/path.jpg",
        "vote_average": 1.0,
        "vote_count": 1,
        "episode_run_time": [32, 23],
        "first_air_date": "2021-06-12",
        "genres": [
          {
            "id": 99,
            "name": "Documentary",
          },
        ],
        "seasons": [
          {
            "air_date": "2021-06-12",
            "episode_count": 1,
            "id": 1,
            "name": "name",
            "overview": "overview",
            "poster_path": "/path.jpg",
            "season_number": 1
          }
        ],
        "homepage": "homepage",
        "name": "name",
        "number_of_episodes": 1,
        "number_of_seasons": 1,
        "original_language": "en",
        "original_name": "original name",
        "origin_country": ["US"],
        "status": "status",
        "tagline": "tagline",
      };
      expect(result, expectedJsonMap);
    });
  });
}
