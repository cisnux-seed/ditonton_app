import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_series/presentation/bloc/modify_watchlist_tv_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_detail_bloc.dart';
import 'package:tv_series/presentation/bloc/watchlist_tv_status_bloc.dart';
import 'package:tv_series/presentation/pages/tv_detail_page.dart';
import '../../dummy_data/dummy_objects.dart';
import 'tv_detail_page_test_mocks.dart';

void main() {
  late final MockWatchlistTvStatusBloc mockWatchlistTvStatusBloc;
  late final MockModifyWatchlistTvBloc mockModifyWatchlistTvBloc;
  late final MockTvDetailBloc mockTvDetailBloc;

  setUpAll(() {
    registerFallbackValue(WatchlistTvStatusStateFake());
    registerFallbackValue(WatchlistTvStatusEventFake());
    registerFallbackValue(ModifyWatchlistTvStateFake());
    registerFallbackValue(ModifyWatchlistTvEventFake());
    registerFallbackValue(TvDetailStateFake());
    registerFallbackValue(TvDetailEventFake());

    mockWatchlistTvStatusBloc = MockWatchlistTvStatusBloc();
    mockModifyWatchlistTvBloc = MockModifyWatchlistTvBloc();
    mockTvDetailBloc = MockTvDetailBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<WatchlistTvStatusBloc>.value(
      value: mockWatchlistTvStatusBloc,
      child: BlocProvider<ModifyWatchlistTvBloc>.value(
        value: mockModifyWatchlistTvBloc,
        child: BlocProvider<TvDetailBloc>.value(
          value: mockTvDetailBloc,
          child: MaterialApp(
            home: body,
            theme: ThemeData.dark().copyWith(
              primaryColor: kRichBlack,
              scaffoldBackgroundColor: kRichBlack,
              textTheme: kTextTheme,
              colorScheme: kColorScheme.copyWith(
                secondary: kMikadoYellow,
              ),
            ),
          ),
        ),
      ),
    );
  }

  const id = 1;

  group('detail tv series page', () {
    testWidgets(
        'should display CircularProgressIndicator when state is TvDetailLoading',
        (WidgetTester tester) async {
      when(() => mockTvDetailBloc.state).thenReturn(TvDetailLoading());
      when(() => mockWatchlistTvStatusBloc.state).thenReturn(TvStatusEmpty());
      when(() => mockModifyWatchlistTvBloc.state).thenReturn(TvEmpty());
      final circularProgressIndicator = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget(TvDetailPage(id: id)));

      expect(circularProgressIndicator, findsOneWidget);
    });

    testWidgets('should display Text when state is TvDetailError',
        (WidgetTester tester) async {
      when(() => mockTvDetailBloc.state).thenReturn(TvDetailError('Failed'));
      when(() => mockWatchlistTvStatusBloc.state).thenReturn(TvStatusEmpty());
      when(() => mockModifyWatchlistTvBloc.state).thenReturn(TvEmpty());
      final errorText = find.text('Failed');

      await tester.pumpWidget(_makeTestableWidget(TvDetailPage(id: id)));

      expect(errorText, findsOneWidget);
    });

    testWidgets(
        'should display Icon Check when state is TvDetailHasData and TvStatusState(true)',
        (WidgetTester tester) async {
      when(() => mockTvDetailBloc.state)
          .thenReturn(TvDetailHasData(tTvDetail, tTvList));
      when(() => mockWatchlistTvStatusBloc.state)
          .thenReturn(TvStatusState(true));
      when(() => mockModifyWatchlistTvBloc.state).thenReturn(TvEmpty());
      final iconCheck = find.byIcon(Icons.check);

      await tester.pumpWidget(_makeTestableWidget(TvDetailPage(id: id)));

      expect(iconCheck, findsOneWidget);
    });

    testWidgets(
        'should display Icon Add when state is TvDetailHasData and TvStatusState(false)',
        (WidgetTester tester) async {
      when(() => mockTvDetailBloc.state)
          .thenReturn(TvDetailHasData(tTvDetail, tTvList));
      when(() => mockWatchlistTvStatusBloc.state)
          .thenReturn(TvStatusState(false));
      when(() => mockModifyWatchlistTvBloc.state).thenReturn(TvEmpty());
      final iconCheck = find.byIcon(Icons.add);

      await tester.pumpWidget(_makeTestableWidget(TvDetailPage(id: id)));

      expect(iconCheck, findsOneWidget);
    });

    testWidgets('should display Snackbar when state is AddedTv',
        (WidgetTester tester) async {
      when(() => mockTvDetailBloc.state)
          .thenReturn(TvDetailHasData(tTvDetail, tTvList));
      when(() => mockWatchlistTvStatusBloc.state)
          .thenReturn(TvStatusState(false));
      when(() => mockModifyWatchlistTvBloc.state)
          .thenReturn(AddedTv('Added to Watchlist'));
      whenListen(
          mockModifyWatchlistTvBloc,
          Stream.fromIterable([
            TvLoading(),
            AddedTv('Added to Watchlist'),
          ]));
      final watchlistButton = find.byType(ElevatedButton);

      await tester.pumpWidget(_makeTestableWidget(TvDetailPage(id: 1)));

      expect(find.byIcon(Icons.add), findsOneWidget);

      await tester.tap(watchlistButton);
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Added to Watchlist'), findsOneWidget);
    });

    testWidgets('should display Snackbar when state is RemovedTv',
        (WidgetTester tester) async {
      when(() => mockTvDetailBloc.state)
          .thenReturn(TvDetailHasData(tTvDetail, tTvList));
      when(() => mockWatchlistTvStatusBloc.state)
          .thenReturn(TvStatusState(true));
      when(() => mockModifyWatchlistTvBloc.state)
          .thenReturn(RemovedTv('Removed from Watchlist'));
      whenListen(
          mockModifyWatchlistTvBloc,
          Stream.fromIterable([
            TvLoading(),
            RemovedTv('Removed from Watchlist'),
          ]));
      final watchlistButton = find.byType(ElevatedButton);

      await tester.pumpWidget(_makeTestableWidget(TvDetailPage(id: 1)));

      expect(find.byIcon(Icons.check), findsOneWidget);

      await tester.tap(watchlistButton);
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Removed from Watchlist'), findsOneWidget);
    });

    testWidgets(
        'should display AlertDialog when state is ModifyWatchlistTvError',
        (WidgetTester tester) async {
      when(() => mockTvDetailBloc.state)
          .thenReturn(TvDetailHasData(tTvDetail, tTvList));
      when(() => mockWatchlistTvStatusBloc.state)
          .thenReturn(TvStatusState(false));
      when(() => mockModifyWatchlistTvBloc.state)
          .thenReturn(ModifyWatchlistTvError('Failed'));
      whenListen(
          mockModifyWatchlistTvBloc,
          Stream.fromIterable([
            TvLoading(),
            ModifyWatchlistTvError('Failed'),
          ]));
      final watchlistButton = find.byType(ElevatedButton);

      await tester.pumpWidget(_makeTestableWidget(TvDetailPage(id: 1)));

      expect(find.byIcon(Icons.add), findsOneWidget);

      await tester.tap(watchlistButton, warnIfMissed: false);
      await tester.pump();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Failed'), findsOneWidget);
    });
  });
}
