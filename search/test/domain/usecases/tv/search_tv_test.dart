import 'package:core/domain/entities/tv.dart';
import 'package:mockito/mockito.dart';
import '../../../../../core/test/helpers/test_helper.mocks.dart';
import '../../../../lib/domain/usecases/tv/search_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';

void main() {
  late SearchTv usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = SearchTv(mockTvRepository);
  });

  final tTv = <Tv>[];
  const tQuery = 'squid game';

  test('should get list of tv series from the repository', () async {
    // arrange
    when(mockTvRepository.searchTv(tQuery)).thenAnswer((_) async => Right(tTv));
    // act
    final result = await usecase.execute(tQuery);
    // assert
    expect(result, Right(tTv));
  });
}
