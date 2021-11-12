import 'package:core/presentation/bloc/movies/now_playing_movies_bloc.dart';
import 'package:core/domain/usecases/movies/get_now_playing_movies.dart';
import 'now_playing_movies_bloc_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../dummy_data/dummy_objects.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

@GenerateMocks([GetNowPlayingMovies])
void main() {
  late NowPlayingMoviesBloc nowPlayingMoviesBloc;
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;

  setUp(() {
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    nowPlayingMoviesBloc = NowPlayingMoviesBloc(mockGetNowPlayingMovies);
  });

  group('now playing movies', () {
    test('intial state should be on page', () {
      expect(nowPlayingMoviesBloc.state, NowPlayingMoviesEmpty());
    });

    blocTest<NowPlayingMoviesBloc, NowPlayingMoviesState>(
      'should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetNowPlayingMovies.execute())
            .thenAnswer((_) async => Right(tMovieList));
        return nowPlayingMoviesBloc;
      },
      act: (bloc) => bloc.add(FetchNowPlayingMovies()),
      wait: const Duration(milliseconds: 500),
      verify: (_) => FetchNowPlayingMovies().props,
      expect: () => [
        NowPlayingMoviesLoading(),
        NowPlayingMoviesHasData(tMovieList),
      ],
    );

    blocTest<NowPlayingMoviesBloc, NowPlayingMoviesState>(
      'Should emit [Loading, Error] when data is gotten is unsuccessful',
      build: () {
        when(mockGetNowPlayingMovies.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return nowPlayingMoviesBloc;
      },
      wait: const Duration(milliseconds: 500),
      act: (bloc) => bloc.add(FetchNowPlayingMovies()),
      verify: (_) => FetchNowPlayingMovies().props,
      expect: () => [
        NowPlayingMoviesLoading(),
        NowPlayingMoviesError('Server Failure'),
      ],
    );
  });
}
