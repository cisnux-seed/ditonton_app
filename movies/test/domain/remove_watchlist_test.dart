import 'package:flutter_test/flutter_test.dart';
import 'package:movies/domain/usecases/remove_watchlist.dart';
import '../dummy_data/dummy_objects.dart';
import '../helpers/test_helper.mocks.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

void main() {
  late RemoveWatchlistMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = RemoveWatchlistMovies(mockMovieRepository);
  });

  test('should remove watchlist movie from repository', () async {
    // arrange
    when(mockMovieRepository.removeWatchlistMovies(tMovieDetail))
        .thenAnswer((_) async => Right('Removed from watchlist'));
    // act
    final result = await usecase.execute(tMovieDetail);
    // assert
    verify(mockMovieRepository.removeWatchlistMovies(tMovieDetail));
    expect(result, Right('Removed from watchlist'));
  });
}
