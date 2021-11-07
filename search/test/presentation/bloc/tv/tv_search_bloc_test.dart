import 'package:bloc_test/bloc_test.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:search/domain/usecases/tv/search_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:search/presentation/bloc/tv/tv_search_bloc.dart';
import 'tv_search_bloc_test.mocks.dart';

@GenerateMocks([SearchTv])
void main() {
  late TvSearchBloc searchBloc;
  late MockSearchTv mockSearchTv;

  setUp(() {
    mockSearchTv = MockSearchTv();
    searchBloc = TvSearchBloc(mockSearchTv);
  });

  final tTv = Tv(
    backdropPath: 'backdropPath',
    genreIds: const [1, 2, 3],
    id: 1,
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    voteAverage: 1,
    voteCount: 1,
    firstAirDate: '2021-06-12',
    name: 'name',
    originalLanguage: 'en',
    originalName: 'orginalName',
    originCountry: const ["US"],
  );

  final tTvList = <Tv>[tTv];
  const tQuery = 'squid game';

  group('search tv series', () {
    test('intial state should be on page', () {
      expect(searchBloc.state, TvSearchEmpty());
    });

    blocTest<TvSearchBloc, TvSearchState>(
      'should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockSearchTv.execute(tQuery))
            .thenAnswer((_) async => Right(tTvList));
        return searchBloc;
      },
      act: (bloc) => bloc.add(TvOnQueryChanged(tQuery)),
      wait: const Duration(milliseconds: 500),
      verify: (_) => TvOnQueryChanged(tQuery).props,
      expect: () => [
        TvSearchLoading(),
        TvSearchHasData(tTvList),
      ],
    );

    blocTest<TvSearchBloc, TvSearchState>(
      'should emit [Loading, HasData] when data is gotten successfully but it return empty list',
      build: () {
        when(mockSearchTv.execute(tQuery)).thenAnswer((_) async => Right([]));
        return searchBloc;
      },
      act: (bloc) => bloc.add(TvOnQueryChanged(tQuery)),
      wait: const Duration(milliseconds: 500),
      verify: (_) => TvOnQueryChanged(tQuery).props,
      expect: () => [
        TvSearchLoading(),
        TvSearchHasData([]),
      ],
    );

    blocTest<TvSearchBloc, TvSearchState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockSearchTv.execute(tQuery))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return searchBloc;
      },
      act: (bloc) => bloc.add(TvOnQueryChanged(tQuery)),
      verify: (_) => TvOnQueryChanged(tQuery).props,
      wait: const Duration(milliseconds: 500),
      expect: () => [
        TvSearchLoading(),
        TvSearchError('Server Failure'),
      ],
    );
  });
}
