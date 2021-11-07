import 'package:core/data/models/movie_model.dart';
import 'package:core/data/models/movie_table.dart';
import 'package:core/data/models/tv_model.dart';
import 'package:core/data/models/tv_table.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/entities/movie_detail.dart';
import 'package:core/domain/entities/season.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/entities/tv_detail.dart';

const tMovieModel = MovieModel(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final tMovieModelList = <MovieModel>[tMovieModel];

final tMovie = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: const [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final tMovieList = [tMovie];

final tTv = Tv(
  backdropPath: '/oaGvjB0DvdhXhOAuADfHb261ZHa.jpg',
  genreIds: const [10759, 9648, 18],
  id: 9340,
  overview:
      "Hundreds of cash-strapped players accept a strange invitation to compete in children's games—with high stakes. But, a tempting prize awaits the victor.",
  popularity: 60.441,
  posterPath: '/dDlEmu3EZ0Pgg93K2SVNLCjCSvE.jpg',
  voteAverage: 7.8,
  voteCount: 7893,
  firstAirDate: '2021-09-17',
  name: 'Squid Game',
  originalLanguage: 'ko',
  originalName: '오징어 게임',
  originCountry: const ["KR"],
);

final tTvList = [tTv];

const tMovieCache = MovieTable(
  id: 557,
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  title: 'Spider-Man',
);

final tMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

final tTvDetail = TvDetail(
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  overview: 'overview',
  posterPath: 'posterPath',
  voteAverage: 1.0,
  voteCount: 1,
  episodeRuntime: [50, 50],
  firstAirDate: '2021-06-12',
  name: 'name',
  numberOfEpisodes: 1,
  numberOfSeasons: 1,
  originalName: 'originalName',
  seasons: [
    Season(
      airDate: "2021-06-12",
      episodeCount: 8,
      id: 1,
      name: "name",
      overview: "overview",
      posterPath: 'posterpath',
      seasonNumber: 2,
    )
  ],
);

final tWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final tWatchlistTv = Tv.watchlist(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);

const tMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

const tTvModel = TvModel(
  backdropPath: '/oaGvjB0DvdhXhOAuADfHb261ZHa.jpg',
  genreIds: [10759, 9648, 18],
  id: 9340,
  overview:
      "Hundreds of cash-strapped players accept a strange invitation to compete in children's games—with high stakes. But, a tempting prize awaits the victor.",
  popularity: 60.441,
  posterPath: '/dDlEmu3EZ0Pgg93K2SVNLCjCSvE.jpg',
  voteAverage: 7.8,
  voteCount: 7893,
  firstAirDate: '2021-09-17',
  name: 'Squid Game',
  originalLanguage: 'ko',
  originalName: '오징어 게임',
  originCountry: ["KR"],
);

const tTvCache = TvTable(
  id: 9340,
  overview:
      "Hundreds of cash-strapped players accept a strange invitation to compete in children's games—with high stakes. But, a tempting prize awaits the victor.",
  posterPath: '/dDlEmu3EZ0Pgg93K2SVNLCjCSvE.jpg',
  name: 'Squid Game',
);

final tTvModelList = <TvModel>[tTvModel];

const tTvTable = TvTable(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);

final tMovieMap = {
  'id': 1,
  'overview': 'overview',
  'poster_path': 'posterPath',
  'title': 'title',
};

final tTvMap = {
  'id': 1,
  'overview': 'overview',
  'poster_path': 'posterPath',
  'name': 'name',
};

final tTvCacheMap = <String, dynamic>{
  "id": 9340,
  "overview":
      "Hundreds of cash-strapped players accept a strange invitation to compete in children's games—with high stakes. But, a tempting prize awaits the victor.",
  "poster_path": '/dDlEmu3EZ0Pgg93K2SVNLCjCSvE.jpg',
  "name": 'Squid Game',
};

final tMovieCacheMap = <String, dynamic>{
  'id': 557,
  'overview':
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  'poster_path': '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  'title': 'Spider-Man',
};

final tMovieFromCache = Movie(
  adult: null,
  backdropPath: null,
  genreIds: null,
  id: 557,
  originalTitle: null,
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: null,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: null,
  title: 'Spider-Man',
  video: null,
  voteAverage: null,
  voteCount: null,
);

final tTvFromCache = Tv(
  backdropPath: null,
  genreIds: null,
  id: 9340,
  overview:
      "Hundreds of cash-strapped players accept a strange invitation to compete in children's games—with high stakes. But, a tempting prize awaits the victor.",
  popularity: null,
  posterPath: '/dDlEmu3EZ0Pgg93K2SVNLCjCSvE.jpg',
  name: 'Squid Game',
  voteAverage: null,
  voteCount: null,
  firstAirDate: null,
  originalLanguage: null,
  originalName: null,
  originCountry: null,
);
