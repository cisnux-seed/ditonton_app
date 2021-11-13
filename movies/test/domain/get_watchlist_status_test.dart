import 'package:flutter_test/flutter_test.dart';
import 'package:movies/domain/usecases/get_watchlist_status.dart';
import '../helpers/test_helper.mocks.dart';
import 'package:mockito/mockito.dart';

void main() {
  late GetWatchListMoviesStatus usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetWatchListMoviesStatus(mockMovieRepository);
  });

  test('should get watchlist status from repository', () async {
    // arrange
    when(mockMovieRepository.isAddedToWatchlistMovies(1))
        .thenAnswer((_) async => true);
    // act
    final result = await usecase.execute(1);
    // assert
    expect(result, true);
  });
}
