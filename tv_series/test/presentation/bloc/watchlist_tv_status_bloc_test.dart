import 'package:tv_series/domain/usecases/get_watchlist_status_tv.dart';
import 'package:tv_series/presentation/bloc/watchlist_tv_status_bloc.dart';
import 'watchlist_tv_status_bloc_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([GetWatchListTvStatus])
void main() {
  late WatchlistTvStatusBloc watchlistTvStatusBloc;
  late MockGetWatchListTvStatus mockGetWatchListTvStatus;

  setUp(() {
    mockGetWatchListTvStatus = MockGetWatchListTvStatus();
    watchlistTvStatusBloc = WatchlistTvStatusBloc(mockGetWatchListTvStatus);
  });

  const tId = 1;

  group('watchlist movies status', () {
    test('intial state should be on page', () {
      expect(watchlistTvStatusBloc.state, TvStatusEmpty());
    });

    blocTest<WatchlistTvStatusBloc, WatchlistTvStatusState>(
      'should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetWatchListTvStatus.execute(tId))
            .thenAnswer((_) async => true);
        return watchlistTvStatusBloc;
      },
      act: (bloc) => bloc.add(FetchTvStatus(tId)),
      wait: const Duration(milliseconds: 500),
      verify: (_) => FetchTvStatus(tId).props,
      expect: () => [
        TvStatusState(true),
      ],
    );
  });
}
