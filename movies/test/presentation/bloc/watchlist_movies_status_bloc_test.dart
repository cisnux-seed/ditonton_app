import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/domain/usecases/get_watchlist_status.dart';
import 'package:movies/presentation/bloc/watchlist_movies_status_bloc.dart';

import 'watchlist_movies_status_bloc_test.mocks.dart';

@GenerateMocks([GetWatchListMoviesStatus])
void main() {
  late WatchlistMoviesStatusBloc watchlistMoviesStatusBloc;
  late MockGetWatchListMoviesStatus mockGetWatchListMoviesStatus;

  setUp(() {
    mockGetWatchListMoviesStatus = MockGetWatchListMoviesStatus();
    watchlistMoviesStatusBloc =
        WatchlistMoviesStatusBloc(mockGetWatchListMoviesStatus);
  });

  const tId = 1;

  group('watchlist movies status', () {
    test('intial state should be on page', () {
      expect(watchlistMoviesStatusBloc.state, MovieStatusEmpty());
    });

    blocTest<WatchlistMoviesStatusBloc, WatchlistMoviesStatusState>(
      'should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetWatchListMoviesStatus.execute(tId))
            .thenAnswer((_) async => true);
        return watchlistMoviesStatusBloc;
      },
      act: (bloc) => bloc.add(FetchMovieStatus(tId)),
      wait: const Duration(milliseconds: 500),
      verify: (_) => FetchMovieStatus(tId).props,
      expect: () => [
        MovieStatusState(true),
      ],
    );
  });
}
