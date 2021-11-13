import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/data/datasources/movie_local_data_source.dart';
import '../../helpers/test_helper.mocks.dart';
import '../../dummy_data/dummy_objects.dart';
import 'package:mockito/mockito.dart';

void main() {
  late MovieLocalDataSourceImpl dataSource;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    dataSource = MovieLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });

  group('cache now playing movies', () {
    test('should call database helper to save data', () async {
      // arrange
      when(mockDatabaseHelper.clearCacheMovies('now playing'))
          .thenAnswer((_) async => 1);
      // act
      await dataSource.cacheNowPlayingMovies([tMovieCache]);
      // assert
      verify(mockDatabaseHelper.clearCacheMovies('now playing'));
      verify(mockDatabaseHelper
          .insertCacheTransactionMovies([tMovieCache], 'now playing'));
    });

    test('should return list of movies from db when data exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheMovies('now playing'))
          .thenAnswer((_) async => [tMovieCacheMap].toList());
      final result = await dataSource.getCachedNowPlayingMovies();
      // assert
      expect(result, [tMovieCache]);
    });

    test('should throw CacheException when cache data is not exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheMovies('now playing'))
          .thenAnswer((_) async => []);
      // act
      final call = dataSource.getCachedNowPlayingMovies();
      // assert
      expect(() => call, throwsA(isA<CacheException>()));
    });
  });

  group('cache popular movies', () {
    test('should call database helper to save data', () async {
      // arrange
      when(mockDatabaseHelper.clearCacheMovies('popular movies'))
          .thenAnswer((_) async => 1);
      // act
      await dataSource.cachePopularMovies([tMovieCache]);
      // assert
      verify(mockDatabaseHelper.clearCacheMovies('popular movies'));
      verify(mockDatabaseHelper
          .insertCacheTransactionMovies([tMovieCache], 'popular movies'));
    });

    test('should return list of movies from db when data exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheMovies('popular movies'))
          .thenAnswer((_) async => [tMovieCacheMap].toList());
      final result = await dataSource.getCachedPopularMovies();
      // assert
      expect(result, [tMovieCache]);
    });

    test('should throw CacheException when cache data is not exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheMovies('popular movies'))
          .thenAnswer((_) async => []);
      // act
      final call = dataSource.getCachedPopularMovies();
      // assert
      expect(() => call, throwsA(isA<CacheException>()));
    });
  });

  group('cache top rated movies', () {
    test('should call database helper to save data', () async {
      // arrange
      when(mockDatabaseHelper.clearCacheMovies('top rated movies'))
          .thenAnswer((_) async => 1);
      // act
      await dataSource.cacheTopRatedMovies([tMovieCache]);
      // assert
      verify(mockDatabaseHelper.clearCacheMovies('top rated movies'));
      verify(mockDatabaseHelper
          .insertCacheTransactionMovies([tMovieCache], 'top rated movies'));
    });

    test('should return list of movies from db when data exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheMovies('top rated movies'))
          .thenAnswer((_) async => [tMovieCacheMap].toList());
      final result = await dataSource.getCachedTopRatedMovies();
      // assert
      expect(result, [tMovieCache]);
    });

    test('should throw CacheException when cache data is not exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheMovies('top rated movies'))
          .thenAnswer((_) async => []);
      // act
      final call = dataSource.getCachedTopRatedMovies();
      // assert
      expect(() => call, throwsA(isA<CacheException>()));
    });
  });

  group('save watchlist', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlistMovies(tMovieTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.insertWatchlistMovies(tMovieTable);
      // assert
      expect(result, 'Added to Watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlistMovies(tMovieTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.insertWatchlistMovies(tMovieTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlistMovies(tMovieTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.removeWatchlistMovies(tMovieTable);
      // assert
      expect(result, 'Removed from Watchlist');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlistMovies(tMovieTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.removeWatchlistMovies(tMovieTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get Movie Detail By Id', () {
    final tId = 1;

    test('should return Movie Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelper.getMovieById(tId))
          .thenAnswer((_) async => tMovieMap);
      // act
      final result = await dataSource.getMovieById(tId);
      // assert
      expect(result, tMovieTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelper.getMovieById(tId)).thenAnswer((_) async => null);
      // act
      final result = await dataSource.getMovieById(tId);
      // assert
      expect(result, null);
    });
  });

  group('Get watchlist movies', () {
    test('should return list of MovieTable from database', () async {
      // arrange
      when(mockDatabaseHelper.getWatchlistMovies())
          .thenAnswer((_) async => [tMovieMap]);
      // act
      final result = await dataSource.getWatchlistMovies();
      // assert
      expect(result, [tMovieTable]);
    });
  });
}
