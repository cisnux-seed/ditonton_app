import 'package:core/data/models/genre_model.dart';
import 'package:core/data/models/movie_detail_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tMovieDetailResponseModel = MovieDetailResponse(
    backdropPath: "/path.jpg",
    id: 1,
    overview: "overview",
    popularity: 1.0,
    posterPath: "/path.jpg",
    voteAverage: 1.0,
    voteCount: 1,
    genres: [
      GenreModel(id: 99, name: "Documentary"),
    ],
    homepage: "homepage",
    originalLanguage: "en",
    status: "status",
    tagline: "tagline",
    adult: false,
    budget: 1,
    imdbId: 'imdbId',
    originalTitle: 'originalTitle',
    releaseDate: '2021-06-23',
    revenue: 1,
    runtime: 1,
    title: 'title',
    video: true,
  );

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange
      // act
      final result = tMovieDetailResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "backdrop_path": "/path.jpg",
        "id": 1,
        "overview": "overview",
        "popularity": 1.0,
        "poster_path": "/path.jpg",
        "vote_average": 1.0,
        "vote_count": 1,
        "genres": [
          {
            "id": 99,
            "name": "Documentary",
          },
        ],
        "homepage": "homepage",
        "original_language": "en",
        "status": "status",
        "tagline": "tagline",
        "adult": false,
        "budget": 1,
        "imdb_id": 'imdbId',
        "original_title": 'originalTitle',
        "release_date": '2021-06-23',
        "revenue": 1,
        "runtime": 1,
        "title": 'title',
        "video": true,
      };
      expect(result, expectedJsonMap);
    });
  });
}
