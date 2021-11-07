import 'package:core/core.dart';
import 'package:core/data/models/genre_model.dart';
import 'package:core/data/models/season_model.dart';
import 'package:core/data/models/tv_detail_model.dart';
import 'package:core/data/models/tv_model.dart';
import 'package:core/data/repositories/tv_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helpers/test_helper.mocks.dart';
import '../../dummy_data/dummy_objects.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'dart:io';

void main() {
  late TvRepositoryImpl repository;
  late MockTvRemoteDataSource mockRemoteDataSource;
  late MockTvLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockTvRemoteDataSource();
    mockLocalDataSource = MockTvLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = TvRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('On The Air Tv Series', () {
    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getOnTheAirTv()).thenAnswer((_) async => []);
      // act
      await repository.getOnTheAirTv();
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    group('when device is online', () {
      setUp(() async {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getOnTheAirTv())
            .thenAnswer((_) async => tTvModelList);
        // act
        final result = await repository.getOnTheAirTv();
        final resultList = result.getOrElse(() => []);
        // assert
        verify(mockRemoteDataSource.getOnTheAirTv());
        expect(resultList, tTvList);
      });

      test(
          'should cache data locally when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getOnTheAirTv())
            .thenAnswer((_) async => tTvModelList);
        // act
        await repository.getOnTheAirTv();
        // assert
        verify(mockRemoteDataSource.getOnTheAirTv());
        verify(mockLocalDataSource.cacheOnTheAirTv([tTvCache]));
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        // arrange
        when(mockRemoteDataSource.getOnTheAirTv()).thenThrow(ServerException());
        // act
        final result = await repository.getOnTheAirTv();
        // assert
        verify(mockRemoteDataSource.getOnTheAirTv());
        expect(result, equals(Left(ServerFailure(''))));
      });
    });

    group('when device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return cached data when device is offline', () async {
        // arrange
        when(mockLocalDataSource.getCachedOnTheAirTv())
            .thenAnswer((_) async => [tTvCache]);
        // act
        final result = await repository.getOnTheAirTv();
        // assert
        verify(mockLocalDataSource.getCachedOnTheAirTv());
        final resultList = result.getOrElse(() => []);
        expect(resultList, [tTvFromCache]);
      });

      test('should return CacheFailure when app has no cache', () async {
        // arrange
        when(mockLocalDataSource.getCachedOnTheAirTv())
            .thenThrow(CacheException('No Cache'));
        // act
        final result = await repository.getOnTheAirTv();
        // assert
        verify(mockLocalDataSource.getCachedOnTheAirTv());
        expect(result, Left(CacheFailure('No Cache')));
      });
    });
  });

  group('Popular Tv Series', () {
    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getPopularTv()).thenAnswer((_) async => []);
      // act
      await repository.getPopularTv();
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    group('when device is online', () {
      setUp(() async {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data source is success',
          () async {
        // arrange
        when(mockRemoteDataSource.getPopularTv())
            .thenAnswer((_) async => tTvModelList);
        // act
        final result = await repository.getPopularTv();
        final resultList = result.getOrElse(() => []);
        // assert
        verify(mockRemoteDataSource.getPopularTv());
        expect(resultList, tTvList);
      });

      test(
          'should cache data locally when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getPopularTv())
            .thenAnswer((_) async => tTvModelList);
        // act
        await repository.getPopularTv();
        // assert
        verify(mockRemoteDataSource.getPopularTv());
        verify(mockLocalDataSource.cachePopularTv([tTvCache]));
      });

      test(
          'should return server failure when call to data source is unsuccessful',
          () async {
        // arrange
        when(mockRemoteDataSource.getPopularTv()).thenThrow(ServerException());
        // act
        final result = await repository.getPopularTv();
        // assert
        verify(mockRemoteDataSource.getPopularTv());
        expect(result, Left(ServerFailure('')));
      });
    });

    group('when devices is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return cached data when device is offline', () async {
        // arrange
        when(mockLocalDataSource.getCachedPopularTv())
            .thenAnswer((_) async => [tTvCache]);
        // act
        final result = await repository.getPopularTv();
        // assert
        verify(mockLocalDataSource.getCachedPopularTv());
        final resultList = result.getOrElse(() => []);
        expect(resultList, [tTvFromCache]);
      });

      test('should return CacheFailure when app has no cache', () async {
        // arrange
        when(mockLocalDataSource.getCachedPopularTv())
            .thenThrow(CacheException('No Cache'));
        // act
        final result = await repository.getPopularTv();
        // assert
        verify(mockLocalDataSource.getCachedPopularTv());
        expect(result, Left(CacheFailure('No Cache')));
      });
    });
  });

  group('Top Rated Tv Series', () {
    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getTopRatedTv()).thenAnswer((_) async => []);
      // act
      await repository.getTopRatedTv();
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    group('when device is online', () {
      setUp(() async {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getTopRatedTv())
            .thenAnswer((_) async => tTvModelList);
        // act
        final result = await repository.getTopRatedTv();
        final resultList = result.getOrElse(() => []);
        // assert
        verify(mockRemoteDataSource.getTopRatedTv());
        expect(resultList, tTvList);
      });

      test(
          'should cache data locally when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getTopRatedTv())
            .thenAnswer((_) async => tTvModelList);
        // act
        await repository.getTopRatedTv();
        // assert
        verify(mockRemoteDataSource.getTopRatedTv());
        verify(mockLocalDataSource.cacheTopRatedTv([tTvCache]));
      });

      test(
          'should return ServerFailure when call to data source is unsuccessful',
          () async {
        // arrange
        when(mockRemoteDataSource.getTopRatedTv()).thenThrow(ServerException());
        // act
        final result = await repository.getTopRatedTv();
        // assert
        verify(mockRemoteDataSource.getTopRatedTv());
        expect(result, Left(ServerFailure('')));
      });
    });

    group('when device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return cached data when device is offline', () async {
        // arrange
        when(mockLocalDataSource.getCachedTopRatedTv())
            .thenAnswer((_) async => [tTvCache]);
        // act
        final result = await repository.getTopRatedTv();
        // assert
        verify(mockLocalDataSource.getCachedTopRatedTv());
        final resultList = result.getOrElse(() => []);
        expect(resultList, [tTvFromCache]);
      });

      test('should return CacheFailure when app has no cache', () async {
        // arrange
        when(mockLocalDataSource.getCachedTopRatedTv())
            .thenThrow(CacheException('No Cache'));
        // act
        final result = await repository.getTopRatedTv();
        // assert
        verify(mockLocalDataSource.getCachedTopRatedTv());
        expect(result, Left(CacheFailure('No Cache')));
      });
    });
  });

  group('Get Movie Detail', () {
    const tId = 1;
    const tTvResponse = TvDetailResponse(
      backdropPath: 'backdropPath',
      genres: [GenreModel(id: 1, name: 'Action')],
      homepage: "https://google.com",
      id: 1,
      originalLanguage: 'en',
      overview: 'overview',
      popularity: 1,
      posterPath: 'posterPath',
      status: 'Status',
      tagline: 'Tagline',
      voteAverage: 1.0,
      voteCount: 1,
      episodeRuntime: [50, 50],
      numberOfEpisodes: 1,
      firstAirDate: '2021-06-12',
      name: 'name',
      numberOfSeasons: 1,
      originalName: 'originalName',
      originCountry: ["US"],
      seasons: [
        SeasonModel(
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

    test(
        'should return Tv Series data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvDetail(tId))
          .thenAnswer((_) async => tTvResponse);
      // act
      final result = await repository.getTvDetail(tId);
      // assert
      verify(mockRemoteDataSource.getTvDetail(tId));
      expect(result, equals(Right(tTvDetail)));
    });

    test(
        'should return Server Failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvDetail(tId)).thenThrow(ServerException());
      // act
      final result = await repository.getTvDetail(tId);
      // assert
      verify(mockRemoteDataSource.getTvDetail(tId));
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvDetail(tId))
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTvDetail(tId);
      // assert
      verify(mockRemoteDataSource.getTvDetail(tId));
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Get Tv Series Recommendations', () {
    final tTvList = <TvModel>[];
    const tId = 1;

    test('should return data (tv series list) when the call is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvRecommendations(tId))
          .thenAnswer((_) async => tTvList);
      // act
      final result = await repository.getTvRecommendations(tId);
      // assert
      verify(mockRemoteDataSource.getTvRecommendations(tId));
      final resultList = result.getOrElse(() => []);
      expect(resultList, equals(tTvList));
    });

    test(
        'should return server failure when call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvRecommendations(tId))
          .thenThrow(ServerException());
      // act
      final result = await repository.getTvRecommendations(tId);
      // assertbuild runner
      verify(mockRemoteDataSource.getTvRecommendations(tId));
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvRecommendations(tId))
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTvRecommendations(tId);
      // assert
      verify(mockRemoteDataSource.getTvRecommendations(tId));
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Seach Tv Series', () {
    const tQuery = 'squid game';

    test('should return movie list when call to data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.searchTv(tQuery))
          .thenAnswer((_) async => tTvModelList);
      // act
      final result = await repository.searchTv(tQuery);
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvList);
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.searchTv(tQuery)).thenThrow(ServerException());
      // act
      final result = await repository.searchTv(tQuery);
      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.searchTv(tQuery))
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.searchTv(tQuery);
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('save watchlist tv series', () {
    test('should return success message when saving successful', () async {
      // arrange
      when(mockLocalDataSource.insertWatchlistTv(tTvTable))
          .thenAnswer((_) async => 'Added to Watchlist');
      // act
      final result = await repository.saveWatchlistTv(tTvDetail);
      // assert
      expect(result, const Right('Added to Watchlist'));
    });

    test('should return DatabaseFailure when saving unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.insertWatchlistTv(tTvTable))
          .thenThrow(DatabaseException('Failed to add watchlist'));
      // act
      final result = await repository.saveWatchlistTv(tTvDetail);
      // assert
      expect(result, Left(DatabaseFailure('Failed to add watchlist')));
    });
  });

  group('remove watchlist tv series', () {
    test('should return success message when remove successful', () async {
      // arrange
      when(mockLocalDataSource.removeWatchlistTv(tTvTable))
          .thenAnswer((_) async => 'Removed from watchlist');
      // act
      final result = await repository.removeWatchlistTv(tTvDetail);
      // assert
      expect(result, const Right('Removed from watchlist'));
    });

    test('should return DatabaseFailure when remove unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.removeWatchlistTv(tTvTable))
          .thenThrow(DatabaseException('Failed to remove watchlist'));
      // act
      final result = await repository.removeWatchlistTv(tTvDetail);
      // assert
      expect(result, Left(DatabaseFailure('Failed to remove watchlist')));
    });
  });

  group('get watchlist tv series status', () {
    test('should return watch status whether data is found', () async {
      // arrange
      const tId = 1;
      when(mockLocalDataSource.getTvById(tId)).thenAnswer((_) async => null);
      // act
      final result = await repository.isAddedToWatchlistTv(tId);
      // assert
      expect(result, false);
    });
  });

  group('get watchlist tv series', () {
    test('should return list of Tv Series', () async {
      // arrange
      when(mockLocalDataSource.getWatchlistTv())
          .thenAnswer((_) async => [tTvTable]);
      // act
      final result = await repository.getWatchlistTv();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, [tWatchlistTv]);
    });
  });
}
