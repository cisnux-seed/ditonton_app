import 'package:core/domain/usecases/tv/remove_watchlist_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

void main() {
  late RemoveWatchlistTv usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = RemoveWatchlistTv(mockTvRepository);
  });

  test('should remove watchlist tv from repository', () async {
    // arrange
    when(mockTvRepository.removeWatchlistTv(tTvDetail))
        .thenAnswer((_) async => Right('Removed from watchlist'));
    // act
    final result = await usecase.execute(tTvDetail);
    // assert
    verify(mockTvRepository.removeWatchlistTv(tTvDetail));
    expect(result, Right('Removed from watchlist'));
  });
}
