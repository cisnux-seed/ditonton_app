import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/domain/usecases/get_top_rated_tv.dart';
import 'package:tv_series/presentation/bloc/top_rated_tv_bloc.dart';
import '../../dummy_data/dummy_objects.dart';
import 'top_rated_tv_bloc_test.mocks.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

@GenerateMocks([GetTopRatedTv])
void main() {
  late TopRatedTvBloc nowTopRatedTvBloc;
  late MockGetTopRatedTv mockTopRatedTv;

  setUp(() {
    mockTopRatedTv = MockGetTopRatedTv();
    nowTopRatedTvBloc = TopRatedTvBloc(mockTopRatedTv);
  });

  group('top rated tv', () {
    test('intial state should be on page', () {
      expect(nowTopRatedTvBloc.state, TopRatedTvEmpty());
    });

    blocTest<TopRatedTvBloc, TopRatedTvState>(
      'should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockTopRatedTv.execute()).thenAnswer((_) async => Right(tTvList));
        return nowTopRatedTvBloc;
      },
      act: (bloc) => bloc.add(FetchTopRatedTv()),
      wait: const Duration(milliseconds: 500),
      verify: (_) => FetchTopRatedTv().props,
      expect: () => [
        TopRatedTvLoading(),
        TopRatedTvHasData(tTvList),
      ],
    );

    blocTest<TopRatedTvBloc, TopRatedTvState>(
      'Should emit [Loading, Error] when data is gotten unsuccessful',
      build: () {
        when(mockTopRatedTv.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return nowTopRatedTvBloc;
      },
      wait: const Duration(milliseconds: 500),
      act: (bloc) => bloc.add(FetchTopRatedTv()),
      verify: (_) => FetchTopRatedTv().props,
      expect: () => [
        TopRatedTvLoading(),
        TopRatedTvError('Server Failure'),
      ],
    );
  });
}
