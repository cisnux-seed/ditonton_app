import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/domain/usecases/save_watchlist_tv.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late SaveWatchlistTv usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = SaveWatchlistTv(mockTvRepository);
  });

  test('should save tv series to the repository', () async {
    // arrange
    when(mockTvRepository.saveWatchlistTv(tTvDetail))
        .thenAnswer((_) async => Right('Added to Watchlist'));
    // act
    final result = await usecase.execute(tTvDetail);
    // assert
    verify(mockTvRepository.saveWatchlistTv(tTvDetail));
    expect(result, Right('Added to Watchlist'));
  });
}
