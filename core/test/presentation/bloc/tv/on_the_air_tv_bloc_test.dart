import 'package:core/domain/usecases/tv/get_on_the_air_tv.dart';
import 'package:core/presentation/bloc/tv/on_the_air_tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../dummy_data/dummy_objects.dart';
import 'on_the_air_tv_bloc_test.mocks.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

@GenerateMocks([GetOnTheAirTv])
void main() {
  late OnTheAirTvBloc onTheAirTvBloc;
  late MockGetOnTheAirTv mockGetOnTheAirTv;

  setUp(() {
    mockGetOnTheAirTv = MockGetOnTheAirTv();
    onTheAirTvBloc = OnTheAirTvBloc(mockGetOnTheAirTv);
  });

  group('on the air tv', () {
    test('intial state should be on page', () {
      expect(onTheAirTvBloc.state, OnTheAirTvEmpty());
    });

    blocTest<OnTheAirTvBloc, OnTheAirTvState>(
      'should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetOnTheAirTv.execute())
            .thenAnswer((_) async => Right(tTvList));
        return onTheAirTvBloc;
      },
      act: (bloc) => bloc.add(FetchOnTheAirTv()),
      wait: const Duration(milliseconds: 500),
      verify: (_) => FetchOnTheAirTv().props,
      expect: () => [
        OnTheAirTvLoading(),
        OnTheAirTvHasData(tTvList),
      ],
    );

    blocTest<OnTheAirTvBloc, OnTheAirTvState>(
      'Should emit [Loading, Error] when data is gotten is unsuccessful',
      build: () {
        when(mockGetOnTheAirTv.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return onTheAirTvBloc;
      },
      wait: const Duration(milliseconds: 500),
      act: (bloc) => bloc.add(FetchOnTheAirTv()),
      verify: (_) => FetchOnTheAirTv().props,
      expect: () => [
        OnTheAirTvLoading(),
        OnTheAirTvError('Server Failure'),
      ],
    );
  });
}
