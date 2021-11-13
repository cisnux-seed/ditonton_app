import 'package:movies/domain/usecases/get_watchlist_movies.dart';
import 'package:movies/presentation/bloc/show_watchlist_movies_bloc.dart';
import '../../dummy_data/dummy_objects.dart';
import 'show_watchlist_movies_bloc_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

@GenerateMocks([GetWatchlistMovies])
void main() {
  late ShowWatchlistMoviesBloc showWatchlistMoviesBloc;
  late MockGetWatchlistMovies mockGetWatchlistMovies;

  setUp(() {
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    showWatchlistMoviesBloc = ShowWatchlistMoviesBloc(mockGetWatchlistMovies);
  });

  group('show watchlist movies', () {
    test('intial state should be on page', () {
      expect(showWatchlistMoviesBloc.state, ShowWatchlistMoviesEmpty());
    });

    blocTest<ShowWatchlistMoviesBloc, ShowWatchlistMoviesState>(
      'should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetWatchlistMovies.execute())
            .thenAnswer((_) async => Right(tMovieList));
        return showWatchlistMoviesBloc;
      },
      act: (bloc) => bloc.add(FetchWatchlistMovies()),
      wait: const Duration(milliseconds: 500),
      verify: (_) => FetchWatchlistMovies().props,
      expect: () => [
        ShowWatchlistMoviesLoading(),
        ShowWatchlistMoviesHasData(tMovieList),
      ],
    );

    blocTest<ShowWatchlistMoviesBloc, ShowWatchlistMoviesState>(
      'should emit [Loading, Empty] when data is gotten successfully but return empty data',
      build: () {
        when(mockGetWatchlistMovies.execute())
            .thenAnswer((_) async => Right([]));
        return showWatchlistMoviesBloc;
      },
      act: (bloc) => bloc.add(FetchWatchlistMovies()),
      wait: const Duration(milliseconds: 500),
      verify: (_) => FetchWatchlistMovies().props,
      expect: () => [
        ShowWatchlistMoviesLoading(),
        ShowWatchlistMoviesEmpty(),
      ],
    );

    blocTest<ShowWatchlistMoviesBloc, ShowWatchlistMoviesState>(
      'Should emit [Loading, Error] when data is gotten is unsuccessful',
      build: () {
        when(mockGetWatchlistMovies.execute())
            .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
        return showWatchlistMoviesBloc;
      },
      wait: const Duration(milliseconds: 500),
      act: (bloc) => bloc.add(FetchWatchlistMovies()),
      verify: (_) => FetchWatchlistMovies().props,
      expect: () => [
        ShowWatchlistMoviesLoading(),
        ShowWatchlistMoviesError('Failed'),
      ],
    );
  });
}
