import 'package:core/domain/usecases/tv/get_watchlist_tv.dart';
import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

void main() {
  late GetWatchlistTv usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetWatchlistTv(mockTvRepository);
  });

  test('should get list of tv series from the repository', () async {
    // arrange
    when(mockTvRepository.getWatchlistTv())
        .thenAnswer((_) async => Right(tTvList));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTvList));
  });
}
