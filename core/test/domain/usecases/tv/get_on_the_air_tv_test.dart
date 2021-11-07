import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/usecases/tv/get_on_the_air_tv.dart';
import '../../../helpers/test_helper.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

void main() {
  late GetOnTheAirTv usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetOnTheAirTv(mockTvRepository);
  });

  final tTv = <Tv>[];

  test('should get list of tv series from the repository', () async {
    // arrange
    when(mockTvRepository.getOnTheAirTv()).thenAnswer((_) async => Right(tTv));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTv));
  });
}
