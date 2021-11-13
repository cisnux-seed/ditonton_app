import 'package:flutter_test/flutter_test.dart';
import 'package:movies/domain/usecases/get_watchlist_movies.dart';
import '../helpers/test_helper.mocks.dart';
import '../dummy_data/dummy_objects.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

void main() {
  late GetWatchlistMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetWatchlistMovies(mockMovieRepository);
  });

  test('should get list of movies from the repository', () async {
    // arrange
    when(mockMovieRepository.getWatchlistMovies())
        .thenAnswer((_) async => Right(tMovieList));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tMovieList));
  });
}
