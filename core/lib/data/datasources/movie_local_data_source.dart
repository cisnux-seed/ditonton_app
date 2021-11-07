import 'package:core/data/datasources/db/database_helper.dart';
import 'package:core/data/models/movie_table.dart';
import '../../core.dart';

abstract class MovieLocalDataSource {
  Future<String> removeWatchlistMovies(MovieTable movie);
  Future<String> insertWatchlistMovies(MovieTable movie);
  Future<MovieTable?> getMovieById(int id);
  Future<List<MovieTable>> getWatchlistMovies();
  Future<void> cacheNowPlayingMovies(List<MovieTable> movies);
  Future<List<MovieTable>> getCachedNowPlayingMovies();
  Future<void> cachePopularMovies(List<MovieTable> movies);
  Future<List<MovieTable>> getCachedPopularMovies();
  Future<void> cacheTopRatedMovies(List<MovieTable> movies);
  Future<List<MovieTable>> getCachedTopRatedMovies();
}

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  final DatabaseHelper databaseHelper;

  MovieLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> insertWatchlistMovies(MovieTable movie) async {
    try {
      await databaseHelper.insertWatchlistMovies(movie);
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlistMovies(MovieTable movie) async {
    try {
      await databaseHelper.removeWatchlistMovies(movie);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<MovieTable?> getMovieById(int id) async {
    final result = await databaseHelper.getMovieById(id);
    if (result != null) {
      return MovieTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<MovieTable>> getWatchlistMovies() async {
    final result = await databaseHelper.getWatchlistMovies();
    return result.map((data) => MovieTable.fromMap(data)).toList();
  }

  @override
  Future<void> cacheNowPlayingMovies(List<MovieTable> movies) async {
    await databaseHelper.clearCacheMovies('now playing');
    await databaseHelper.insertCacheTransactionMovies(movies, 'now playing');
  }

  @override
  Future<List<MovieTable>> getCachedNowPlayingMovies() async {
    final result = await databaseHelper.getCacheMovies('now playing');
    if (result.isNotEmpty) {
      return result.map((data) => MovieTable.fromMap(data)).toList();
    } else {
      throw CacheException("Can't get the data :(");
    }
  }

  @override
  Future<void> cachePopularMovies(List<MovieTable> movies) async {
    await databaseHelper.clearCacheMovies('popular movies');
    await databaseHelper.insertCacheTransactionMovies(movies, 'popular movies');
  }

  @override
  Future<void> cacheTopRatedMovies(List<MovieTable> movies) async {
    await databaseHelper.clearCacheMovies('top rated movies');
    await databaseHelper.insertCacheTransactionMovies(
      movies,
      'top rated movies',
    );
  }

  @override
  Future<List<MovieTable>> getCachedPopularMovies() async {
    final result = await databaseHelper.getCacheMovies('popular movies');
    if (result.isNotEmpty) {
      return result.map((data) => MovieTable.fromMap(data)).toList();
    } else {
      throw CacheException("Can't get the data :(");
    }
  }

  @override
  Future<List<MovieTable>> getCachedTopRatedMovies() async {
    final result = await databaseHelper.getCacheMovies('top rated movies');
    if (result.isNotEmpty) {
      return result.map((data) => MovieTable.fromMap(data)).toList();
    } else {
      throw CacheException("Can't get the data :(");
    }
  }
}
