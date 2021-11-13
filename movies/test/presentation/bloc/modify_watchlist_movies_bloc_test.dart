import 'package:movies/domain/usecases/remove_watchlist.dart';
import 'package:movies/domain/usecases/save_watchlist.dart';
import 'package:movies/presentation/bloc/modify_watchlist_movies_bloc.dart';
import '../../dummy_data/dummy_objects.dart';
import 'modify_watchlist_movies_bloc_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

@GenerateMocks([SaveWatchlistMovies, RemoveWatchlistMovies])
void main() {
  late ModifyWatchlistMoviesBloc modifyWatchlistMoviesBloc;
  late MockSaveWatchlistMovies mockSaveWatchlistMovies;
  late MockRemoveWatchlistMovies mockRemoveWatchlistMovies;

  setUp(() {
    mockSaveWatchlistMovies = MockSaveWatchlistMovies();
    mockRemoveWatchlistMovies = MockRemoveWatchlistMovies();
    modifyWatchlistMoviesBloc = ModifyWatchlistMoviesBloc(
      saveWatchlistMovies: mockSaveWatchlistMovies,
      removeWatchlistMovies: mockRemoveWatchlistMovies,
    );
  });

  const savedMessage = 'Added to Watchlist';
  const removedMessage = 'Removed from Watchlist';
  const failedMessage = 'Failed';

  group('modify watchlist movies', () {
    test('intial state should be on page', () {
      expect(modifyWatchlistMoviesBloc.state, MovieEmpty());
    });

    blocTest<ModifyWatchlistMoviesBloc, ModifyWatchlistMoviesState>(
      'should emit [Loading, HasData] when save movie is successfully',
      build: () {
        when(mockSaveWatchlistMovies.execute(tMovieDetail))
            .thenAnswer((_) async => Right(savedMessage));
        return modifyWatchlistMoviesBloc;
      },
      act: (bloc) => bloc.add(AddMovie(tMovieDetail)),
      wait: const Duration(milliseconds: 500),
      verify: (_) => AddMovie(tMovieDetail).props,
      expect: () => [
        MovieLoading(),
        AddedMovie(savedMessage),
      ],
    );

    blocTest<ModifyWatchlistMoviesBloc, ModifyWatchlistMoviesState>(
      'should emit [Loading, HasData] when save movie is unsuccessfully',
      build: () {
        when(mockSaveWatchlistMovies.execute(tMovieDetail))
            .thenAnswer((_) async => Left(DatabaseFailure(failedMessage)));
        return modifyWatchlistMoviesBloc;
      },
      act: (bloc) => bloc.add(AddMovie(tMovieDetail)),
      wait: const Duration(milliseconds: 500),
      verify: (_) => AddMovie(tMovieDetail).props,
      expect: () => [
        MovieLoading(),
        ModifyWatchlistMovieError(failedMessage),
      ],
    );

    blocTest<ModifyWatchlistMoviesBloc, ModifyWatchlistMoviesState>(
      'should emit [Loading, HasData] when remove movie is successfully',
      build: () {
        when(mockRemoveWatchlistMovies.execute(tMovieDetail))
            .thenAnswer((_) async => Right(removedMessage));
        return modifyWatchlistMoviesBloc;
      },
      act: (bloc) => bloc.add(RemoveMovie(tMovieDetail)),
      wait: const Duration(milliseconds: 500),
      verify: (_) => RemoveMovie(tMovieDetail).props,
      expect: () => [
        MovieLoading(),
        RemovedMovie(removedMessage),
      ],
    );

    blocTest<ModifyWatchlistMoviesBloc, ModifyWatchlistMoviesState>(
      'should emit [Loading, HasData] when remove movie is unsuccessfully',
      build: () {
        when(mockRemoveWatchlistMovies.execute(tMovieDetail))
            .thenAnswer((_) async => Left(DatabaseFailure(failedMessage)));
        return modifyWatchlistMoviesBloc;
      },
      act: (bloc) => bloc.add(RemoveMovie(tMovieDetail)),
      wait: const Duration(milliseconds: 500),
      verify: (_) => RemoveMovie(tMovieDetail).props,
      expect: () => [
        MovieLoading(),
        ModifyWatchlistMovieError(failedMessage),
      ],
    );
  });
}
