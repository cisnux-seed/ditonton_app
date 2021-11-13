import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_series/presentation/bloc/show_watchlist_tv_bloc.dart';
import 'package:tv_series/presentation/pages/watchlist_tv_page.dart';
import '../../dummy_data/dummy_objects.dart';
import 'watchlist_tv_page_test_mocks.dart';

void main() {
  late final MockShowWatchlistTvBloc mockShowWatchlistTvBloc;

  setUpAll(() {
    registerFallbackValue(ShowWatchlistTvStateFake());
    registerFallbackValue(ShowWatchlistTvEventFake());

    mockShowWatchlistTvBloc = MockShowWatchlistTvBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<ShowWatchlistTvBloc>.value(
      value: mockShowWatchlistTvBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  group('watchlist tv series page', () {
    testWidgets(
        'should display CircularProgressIndicator when state is ShowWatchlistTvLoading',
        (WidgetTester tester) async {
      when(() => mockShowWatchlistTvBloc.state)
          .thenReturn(ShowWatchlistTvLoading());
      final circularProgressIndicator = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget(WatchlistTv()));

      expect(circularProgressIndicator, findsOneWidget);
    });

    testWidgets('should display ListView when state is ShowWatchlistTvHasData',
        (WidgetTester tester) async {
      when(() => mockShowWatchlistTvBloc.state)
          .thenReturn(ShowWatchlistTvHasData(tTvList));
      final listView = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(WatchlistTv()));

      expect(listView, findsOneWidget);
    });

    testWidgets(
        "should display Text('Failed') when state is ShowWatchlistTvError",
        (WidgetTester tester) async {
      when(() => mockShowWatchlistTvBloc.state)
          .thenReturn(ShowWatchlistTvError('Failed'));
      final errorText = find.text('Failed');

      await tester.pumpWidget(_makeTestableWidget(WatchlistTv()));

      expect(errorText, findsOneWidget);
    });

    testWidgets(
        "should display Text(You Don't Have Watchlist Tv Series) when state is ShowWatchlistTvEmpty",
        (WidgetTester tester) async {
      when(() => mockShowWatchlistTvBloc.state)
          .thenReturn(ShowWatchlistTvEmpty());
      final emptyText = find.text("You Don't Have Watchlist Tv Series");

      await tester.pumpWidget(_makeTestableWidget(WatchlistTv()));

      expect(emptyText, findsOneWidget);
    });
  });
}
