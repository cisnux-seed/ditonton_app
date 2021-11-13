import 'package:flutter_test/flutter_test.dart';
import 'package:movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies/presentation/bloc/top_rated_movies_bloc.dart';
import '../../dummy_data/dummy_objects.dart';
import 'top_rated_movies_bloc_test.mocks.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

@GenerateMocks([GetTopRatedMovies])
void main() {
  late TopRatedMoviesBloc nowTopRatedMoviesBloc;
  late MockGetTopRatedMovies mockTopRatedMovies;

  setUp(() {
    mockTopRatedMovies = MockGetTopRatedMovies();
    nowTopRatedMoviesBloc = TopRatedMoviesBloc(mockTopRatedMovies);
  });

  group('search movies', () {
    test('intial state should be on page', () {
      expect(nowTopRatedMoviesBloc.state, TopRatedMoviesEmpty());
    });

    blocTest<TopRatedMoviesBloc, TopRatedMoviesState>(
      'should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockTopRatedMovies.execute())
            .thenAnswer((_) async => Right(tMovieList));
        return nowTopRatedMoviesBloc;
      },
      act: (bloc) => bloc.add(FetchTopRatedMovies()),
      wait: const Duration(milliseconds: 500),
      verify: (_) => FetchTopRatedMovies().props,
      expect: () => [
        TopRatedMoviesLoading(),
        TopRatedMoviesHasData(tMovieList),
      ],
    );

    blocTest<TopRatedMoviesBloc, TopRatedMoviesState>(
      'Should emit [Loading, Error] when data is gotten is unsuccessful',
      build: () {
        when(mockTopRatedMovies.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return nowTopRatedMoviesBloc;
      },
      wait: const Duration(milliseconds: 500),
      act: (bloc) => bloc.add(FetchTopRatedMovies()),
      verify: (_) => FetchTopRatedMovies().props,
      expect: () => [
        TopRatedMoviesLoading(),
        TopRatedMoviesError('Server Failure'),
      ],
    );
  });
}
