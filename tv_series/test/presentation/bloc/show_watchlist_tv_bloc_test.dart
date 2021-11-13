import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/domain/usecases/get_watchlist_tv.dart';
import 'package:tv_series/presentation/bloc/show_watchlist_tv_bloc.dart';
import '../../dummy_data/dummy_objects.dart';
import 'show_watchlist_tv_bloc_test.mocks.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

@GenerateMocks([GetWatchlistTv])
void main() {
  late ShowWatchlistTvBloc showWatchlistTvBloc;
  late MockGetWatchlistTv mockGetWatchlistTv;

  setUp(() {
    mockGetWatchlistTv = MockGetWatchlistTv();
    showWatchlistTvBloc = ShowWatchlistTvBloc(mockGetWatchlistTv);
  });

  group('show watchlist movies', () {
    test('intial state should be on page', () {
      expect(showWatchlistTvBloc.state, ShowWatchlistTvEmpty());
    });

    blocTest<ShowWatchlistTvBloc, ShowWatchlistTvState>(
      'should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetWatchlistTv.execute())
            .thenAnswer((_) async => Right(tTvList));
        return showWatchlistTvBloc;
      },
      act: (bloc) => bloc.add(FetchWatchlistTv()),
      wait: const Duration(milliseconds: 500),
      verify: (_) => FetchWatchlistTv().props,
      expect: () => [
        ShowWatchlistTvLoading(),
        ShowWatchlistTvHasData(tTvList),
      ],
    );

    blocTest<ShowWatchlistTvBloc, ShowWatchlistTvState>(
      'should emit [Loading, Empty] when data is gotten successfully but return empty data',
      build: () {
        when(mockGetWatchlistTv.execute()).thenAnswer((_) async => Right([]));
        return showWatchlistTvBloc;
      },
      act: (bloc) => bloc.add(FetchWatchlistTv()),
      wait: const Duration(milliseconds: 500),
      verify: (_) => FetchWatchlistTv().props,
      expect: () => [
        ShowWatchlistTvLoading(),
        ShowWatchlistTvEmpty(),
      ],
    );

    blocTest<ShowWatchlistTvBloc, ShowWatchlistTvState>(
      'Should emit [Loading, Error] when data is gotten is unsuccessful',
      build: () {
        when(mockGetWatchlistTv.execute())
            .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
        return showWatchlistTvBloc;
      },
      wait: const Duration(milliseconds: 500),
      act: (bloc) => bloc.add(FetchWatchlistTv()),
      verify: (_) => FetchWatchlistTv().props,
      expect: () => [
        ShowWatchlistTvLoading(),
        ShowWatchlistTvError('Failed'),
      ],
    );
  });
}
