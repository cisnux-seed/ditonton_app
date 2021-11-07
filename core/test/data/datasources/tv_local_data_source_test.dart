import 'package:core/core.dart';
import 'package:core/data/datasources/tv_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helpers/test_helper.mocks.dart';
import '../../dummy_data/dummy_objects.dart';
import 'package:mockito/mockito.dart';

void main() {
  late TvLocalDataSourceImpl dataSource;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    dataSource = TvLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });

  group('cache on the air tv', () {
    test('should call database helper to save data', () async {
      // arrange
      when(mockDatabaseHelper.clearCacheTv('on the air'))
          .thenAnswer((_) async => 1);
      // act
      await dataSource.cacheOnTheAirTv([tTvCache]);
      // assert
      verify(mockDatabaseHelper.clearCacheTv('on the air'));
      verify(mockDatabaseHelper
          .insertCacheTransactionTv([tTvCache], 'on the air'));
    });

    test('should return list of tv series from db when data exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheTv('on the air'))
          .thenAnswer((_) async => [tTvCacheMap].toList());
      final result = await dataSource.getCachedOnTheAirTv();
      // assert
      expect(result, [tTvCache]);
    });

    test('should throw CacheException when cache data is not exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheTv('on the air'))
          .thenAnswer((_) async => []);
      // act
      final call = dataSource.getCachedOnTheAirTv();
      // assert
      expect(() => call, throwsA(isA<CacheException>()));
    });
  });

  group('cache popular tv series', () {
    test('should call database helper to save data', () async {
      // arrange
      when(mockDatabaseHelper.clearCacheTv('popular tv'))
          .thenAnswer((_) async => 1);
      // act
      await dataSource.cachePopularTv([tTvCache]);
      // assert
      verify(mockDatabaseHelper.clearCacheTv('popular tv'));
      verify(mockDatabaseHelper
          .insertCacheTransactionTv([tTvCache], 'popular tv'));
    });

    test('should return list of tv series from db when data exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheTv('popular tv'))
          .thenAnswer((_) async => [tTvCacheMap].toList());
      final result = await dataSource.getCachedPopularTv();
      // assert
      expect(result, [tTvCache]);
    });

    test('should throw CacheException when cache data is not exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheTv('popular tv'))
          .thenAnswer((_) async => []);
      // act
      final call = dataSource.getCachedPopularTv();
      // assert
      expect(() => call, throwsA(isA<CacheException>()));
    });
  });

  group('cache top rated series', () {
    test('should call database helper to save data', () async {
      // arrange
      when(mockDatabaseHelper.clearCacheTv('top rated tv'))
          .thenAnswer((_) async => 1);
      // act
      await dataSource.cacheTopRatedTv([tTvCache]);
      // assert
      verify(mockDatabaseHelper.clearCacheTv('top rated tv'));
      verify(mockDatabaseHelper
          .insertCacheTransactionTv([tTvCache], 'top rated tv'));
    });

    test('should return list of tv series from db when data exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheTv('top rated tv'))
          .thenAnswer((_) async => [tTvCacheMap].toList());
      final result = await dataSource.getCachedTopRatedTv();
      // assert
      expect(result, [tTvCache]);
    });

    test('should throw CacheException when cache data is not exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheTv('top rated tv'))
          .thenAnswer((_) async => []);
      // act
      final call = dataSource.getCachedTopRatedTv();
      // assert
      expect(() => call, throwsA(isA<CacheException>()));
    });
  });

  group('save watchlist', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlistTv(tTvTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.insertWatchlistTv(tTvTable);
      // assert
      expect(result, 'Added to Watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlistTv(tTvTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.insertWatchlistTv(tTvTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlistTv(tTvTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.removeWatchlistTv(tTvTable);
      // assert
      expect(result, 'Removed from Watchlist');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlistTv(tTvTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.removeWatchlistTv(tTvTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get Tv Series Detail By Id', () {
    final tId = 1;

    test('should return Tv Series Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelper.getTvById(tId)).thenAnswer((_) async => tTvMap);
      // act
      final result = await dataSource.getTvById(tId);
      // assert
      expect(result, tTvTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelper.getTvById(tId)).thenAnswer((_) async => null);
      // act
      final result = await dataSource.getTvById(tId);
      // assert
      expect(result, null);
    });
  });

  group('Get watchlist Tv Series', () {
    test('should return list of TvTable from database', () async {
      // arrange
      when(mockDatabaseHelper.getWatchlistTv())
          .thenAnswer((_) async => [tTvMap]);
      // act
      final result = await dataSource.getWatchlistTv();
      // assert
      expect(result, [tTvTable]);
    });
  });
}
