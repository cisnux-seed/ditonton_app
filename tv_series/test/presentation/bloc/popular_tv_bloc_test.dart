import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/domain/usecases/get_popular_tv.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:tv_series/presentation/bloc/popular_tv_bloc.dart';
import '../../dummy_data/dummy_objects.dart';
import 'popular_tv_bloc_test.mocks.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

@GenerateMocks([GetPopularTv])
void main() {
  late PopularTvBloc popularTvBloc;
  late MockGetPopularTv mockGetPopularTv;

  setUp(() {
    mockGetPopularTv = MockGetPopularTv();
    popularTvBloc = PopularTvBloc(mockGetPopularTv);
  });

  group('popular tv', () {
    test('intial state should be on page', () {
      expect(popularTvBloc.state, PopularTvEmpty());
    });

    blocTest<PopularTvBloc, PopularTvState>(
      'should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetPopularTv.execute())
            .thenAnswer((_) async => Right(tTvList));
        return popularTvBloc;
      },
      act: (bloc) => bloc.add(FetchPopularTv()),
      wait: const Duration(milliseconds: 500),
      verify: (_) => FetchPopularTv().props,
      expect: () => [
        PopularTvLoading(),
        PopularTvHasData(tTvList),
      ],
    );

    blocTest<PopularTvBloc, PopularTvState>(
      'Should emit [Loading, Error] when data is gotten unsuccessful',
      build: () {
        when(mockGetPopularTv.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return popularTvBloc;
      },
      wait: const Duration(milliseconds: 500),
      act: (bloc) => bloc.add(FetchPopularTv()),
      verify: (_) => FetchPopularTv().props,
      expect: () => [
        PopularTvLoading(),
        PopularTvError('Server Failure'),
      ],
    );
  });
}
