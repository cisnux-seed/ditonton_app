import 'package:flutter_test/flutter_test.dart';
import 'package:movies/domain/usecases/save_watchlist.dart';
import '../dummy_data/dummy_objects.dart';
import '../helpers/test_helper.mocks.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

void main() {
  late SaveWatchlistMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = SaveWatchlistMovies(mockMovieRepository);
  });

  test('should save movie to the repository', () async {
    // arrange
    when(mockMovieRepository.saveWatchlistMovies(tMovieDetail))
        .thenAnswer((_) async => Right('Added to Watchlist'));
    // act
    final result = await usecase.execute(tMovieDetail);
    // assert
    verify(mockMovieRepository.saveWatchlistMovies(tMovieDetail));
    expect(result, Right('Added to Watchlist'));
  });
}
