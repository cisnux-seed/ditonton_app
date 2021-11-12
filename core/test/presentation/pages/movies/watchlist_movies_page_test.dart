import 'package:core/presentation/bloc/movies/show_watchlist_movies_bloc.dart';
import 'package:core/presentation/pages/movies/watchlist_movies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../dummy_data/dummy_objects.dart';
import 'watchlist_movies_page_test_mocks.dart';

void main() {
  late final MockShowWatchlistMoviesBloc mockShowWatchlistMoviesBloc;

  setUpAll(() {
    registerFallbackValue(ShowWatchlistMoviesStateFake());
    registerFallbackValue(ShowWatchlistMoviesEventFake());

    mockShowWatchlistMoviesBloc = MockShowWatchlistMoviesBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<ShowWatchlistMoviesBloc>.value(
      value: mockShowWatchlistMoviesBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  group('watchlist movies page', () {
    testWidgets(
        'should display CircularProgressIndicator when state is ShowWatchlistMoviesLoading',
        (WidgetTester tester) async {
      when(() => mockShowWatchlistMoviesBloc.state)
          .thenReturn(ShowWatchlistMoviesLoading());
      final circularProgressIndicator = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget(WatchlistMovies()));

      expect(circularProgressIndicator, findsOneWidget);
    });

    testWidgets(
        'should display ListView when state is ShowWatchlistMoviesHasData',
        (WidgetTester tester) async {
      when(() => mockShowWatchlistMoviesBloc.state)
          .thenReturn(ShowWatchlistMoviesHasData(tMovieList));
      final listView = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(WatchlistMovies()));

      expect(listView, findsOneWidget);
    });

    testWidgets(
        "should display Text('Failed') when state is ShowWatchlistMoviesError",
        (WidgetTester tester) async {
      when(() => mockShowWatchlistMoviesBloc.state)
          .thenReturn(ShowWatchlistMoviesError('Failed'));
      final errorText = find.text('Failed');

      await tester.pumpWidget(_makeTestableWidget(WatchlistMovies()));

      expect(errorText, findsOneWidget);
    });

    testWidgets(
        "should display Text(You Don't Have Watchlist Movies) when state is ShowWatchlistMoviesEmpty",
        (WidgetTester tester) async {
      when(() => mockShowWatchlistMoviesBloc.state)
          .thenReturn(ShowWatchlistMoviesEmpty());
      final emptyText = find.text("You Don't Have Watchlist Movies");

      await tester.pumpWidget(_makeTestableWidget(WatchlistMovies()));

      expect(emptyText, findsOneWidget);
    });
  });
}
