import 'package:core/presentation/bloc/tv/modify_watchlist_tv_bloc.dart';
import 'package:core/domain/usecases/tv/remove_watchlist_tv.dart';
import 'package:core/domain/usecases/tv/save_watchlist_tv.dart';
import 'modify_watchlist_tv_bloc_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../dummy_data/dummy_objects.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

@GenerateMocks([SaveWatchlistTv, RemoveWatchlistTv])
void main() {
  late ModifyWatchlistTvBloc modifyWatchlistTvBloc;
  late MockSaveWatchlistTv mockSaveWatchlistTv;
  late MockRemoveWatchlistTv mockRemoveWatchlistTv;

  setUp(() {
    mockSaveWatchlistTv = MockSaveWatchlistTv();
    mockRemoveWatchlistTv = MockRemoveWatchlistTv();
    modifyWatchlistTvBloc = ModifyWatchlistTvBloc(
      saveWatchlistTv: mockSaveWatchlistTv,
      removeWatchlistTv: mockRemoveWatchlistTv,
    );
  });

  const savedMessage = 'Added to Watchlist';
  const removedMessage = 'Removed from Watchlist';
  const failedMessage = 'Failed';

  group('modify watchlist tv series', () {
    test('intial state should be on page', () {
      expect(modifyWatchlistTvBloc.state, TvEmpty());
    });

    blocTest<ModifyWatchlistTvBloc, ModifyWatchlistTvState>(
      'should emit [Loading, HasData] when save tv is successfully',
      build: () {
        when(mockSaveWatchlistTv.execute(tTvDetail))
            .thenAnswer((_) async => Right(savedMessage));
        return modifyWatchlistTvBloc;
      },
      act: (bloc) => bloc.add(AddTv(tTvDetail)),
      wait: const Duration(milliseconds: 500),
      verify: (_) => AddTv(tTvDetail).props,
      expect: () => [
        TvLoading(),
        AddedTv(savedMessage),
      ],
    );

    blocTest<ModifyWatchlistTvBloc, ModifyWatchlistTvState>(
      'should emit [Loading, HasData] when save tv is unsuccessfully',
      build: () {
        when(mockSaveWatchlistTv.execute(tTvDetail))
            .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
        return modifyWatchlistTvBloc;
      },
      act: (bloc) => bloc.add(AddTv(tTvDetail)),
      wait: const Duration(milliseconds: 500),
      verify: (_) => AddTv(tTvDetail).props,
      expect: () => [
        TvLoading(),
        ModifyWatchlistTvError(failedMessage),
      ],
    );

    blocTest<ModifyWatchlistTvBloc, ModifyWatchlistTvState>(
      'should emit [Loading, HasData] when remove tv is successfully',
      build: () {
        when(mockRemoveWatchlistTv.execute(tTvDetail))
            .thenAnswer((_) async => Right(removedMessage));
        return modifyWatchlistTvBloc;
      },
      act: (bloc) => bloc.add(RemoveTv(tTvDetail)),
      wait: const Duration(milliseconds: 500),
      verify: (_) => RemoveTv(tTvDetail).props,
      expect: () => [
        TvLoading(),
        RemovedTv(removedMessage),
      ],
    );

    blocTest<ModifyWatchlistTvBloc, ModifyWatchlistTvState>(
      'should emit [Loading, HasData] when remove tv is unsuccessfully',
      build: () {
        when(mockRemoveWatchlistTv.execute(tTvDetail))
            .thenAnswer((_) async => Left(DatabaseFailure(failedMessage)));
        return modifyWatchlistTvBloc;
      },
      act: (bloc) => bloc.add(RemoveTv(tTvDetail)),
      wait: const Duration(milliseconds: 500),
      verify: (_) => RemoveTv(tTvDetail).props,
      expect: () => [
        TvLoading(),
        ModifyWatchlistTvError(failedMessage),
      ],
    );
  });
}
