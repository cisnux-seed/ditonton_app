import 'package:core/domain/usecases/tv/get_tv_detail.dart';
import 'package:core/domain/usecases/tv/get_tv_recommendations.dart';
import 'package:core/presentation/bloc/tv/tv_detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../dummy_data/dummy_objects.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'tv_detail_bloc_test.mocks.dart';

@GenerateMocks([GetTvDetail, GetTvRecommendations])
void main() {
  late TvDetailBloc tvDetailBloc;
  late MockGetTvDetail mockGetMovieDetail;
  late MockGetTvRecommendations mockGetMovieRecommendations;

  setUp(() {
    mockGetMovieDetail = MockGetTvDetail();
    mockGetMovieRecommendations = MockGetTvRecommendations();
    tvDetailBloc = TvDetailBloc(
      getTvDetail: mockGetMovieDetail,
      getTvRecommendations: mockGetMovieRecommendations,
    );
  });

  const tId = 1;
  const failedMessage = 'Failed';

  group('tv detail', () {
    test('intial state should be on page', () {
      expect(tvDetailBloc.state, TvDetailEmpty());
    });

    blocTest<TvDetailBloc, TvDetailState>(
      'should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetMovieDetail.execute(tId))
            .thenAnswer((_) async => Right(tTvDetail));
        when(mockGetMovieRecommendations.execute(tId))
            .thenAnswer((_) async => Right(tTvList));
        return tvDetailBloc;
      },
      act: (bloc) => bloc.add(FetchTvDetail(tId)),
      wait: const Duration(milliseconds: 500),
      verify: (_) => FetchTvDetail(tId).props,
      expect: () => [
        TvDetailLoading(),
        TvDetailHasData(tTvDetail, tTvList),
      ],
    );

    blocTest<TvDetailBloc, TvDetailState>(
      'Should emit [Loading, Error] when tv detail data is gotten is unsuccessful',
      build: () {
        when(mockGetMovieDetail.execute(tId))
            .thenAnswer((_) async => Left(ServerFailure(failedMessage)));
        when(mockGetMovieRecommendations.execute(tId))
            .thenAnswer((_) async => Right(tTvList));
        return tvDetailBloc;
      },
      wait: const Duration(milliseconds: 500),
      act: (bloc) => bloc.add(FetchTvDetail(tId)),
      verify: (_) => [FetchTvDetail(tId).props],
      expect: () => [
        TvDetailLoading(),
        TvDetailError(failedMessage),
      ],
    );

    blocTest<TvDetailBloc, TvDetailState>(
      'Should emit [Loading, Error] when movies recommendation data is gotten is unsuccessful',
      build: () {
        when(mockGetMovieDetail.execute(tId))
            .thenAnswer((_) async => Right(tTvDetail));
        when(mockGetMovieRecommendations.execute(tId))
            .thenAnswer((_) async => Left(ServerFailure(failedMessage)));
        return tvDetailBloc;
      },
      wait: const Duration(milliseconds: 500),
      act: (bloc) => bloc.add(FetchTvDetail(tId)),
      verify: (_) => [FetchTvDetail(tId).props],
      expect: () => [
        TvDetailLoading(),
        TvDetailError(failedMessage),
      ],
    );
  });
}
