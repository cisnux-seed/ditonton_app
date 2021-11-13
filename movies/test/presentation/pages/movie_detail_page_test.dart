import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/presentation/bloc/modify_watchlist_movies_bloc.dart';
import 'package:movies/presentation/bloc/movie_detail_bloc.dart';
import 'package:movies/presentation/bloc/watchlist_movies_status_bloc.dart';
import 'package:movies/presentation/pages/movie_detail_page.dart';
import '../../dummy_data/dummy_objects.dart';
import 'movie_detail_page_test_mocks.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';

void main() {
  late final MockWatchlistMoviesStatusBloc mockWatchlistMoviesStatusBloc;
  late final MockModifyWatchlistMoviesBloc mockModifyWatchlistMoviesBloc;
  late final MockMovieDetailBloc mockMovieDetailBloc;

  setUpAll(() {
    registerFallbackValue(WatchlistMoviesStatusStateFake());
    registerFallbackValue(WatchlistMoviesStatusEventFake());
    registerFallbackValue(ModifyWatchlistMoviesStateFake());
    registerFallbackValue(ModifyWatchlistMoviesEventFake());
    registerFallbackValue(MovieDetailStateFake());
    registerFallbackValue(MovieDetailEventFake());

    mockWatchlistMoviesStatusBloc = MockWatchlistMoviesStatusBloc();
    mockModifyWatchlistMoviesBloc = MockModifyWatchlistMoviesBloc();
    mockMovieDetailBloc = MockMovieDetailBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<WatchlistMoviesStatusBloc>.value(
      value: mockWatchlistMoviesStatusBloc,
      child: BlocProvider<ModifyWatchlistMoviesBloc>.value(
        value: mockModifyWatchlistMoviesBloc,
        child: BlocProvider<MovieDetailBloc>.value(
          value: mockMovieDetailBloc,
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

  group('detail movie page', () {
    testWidgets(
        'should display CircularProgressIndicator when state is MovieDetailLoading',
        (WidgetTester tester) async {
      when(() => mockMovieDetailBloc.state).thenReturn(MovieDetailLoading());
      when(() => mockWatchlistMoviesStatusBloc.state)
          .thenReturn(MovieStatusEmpty());
      when(() => mockModifyWatchlistMoviesBloc.state).thenReturn(MovieEmpty());
      final circularProgressIndicator = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: id)));

      expect(circularProgressIndicator, findsOneWidget);
    });

    testWidgets('should display Text when state is MovieDetailError',
        (WidgetTester tester) async {
      when(() => mockMovieDetailBloc.state)
          .thenReturn(MovieDetailError('Failed'));
      when(() => mockWatchlistMoviesStatusBloc.state)
          .thenReturn(MovieStatusEmpty());
      when(() => mockModifyWatchlistMoviesBloc.state).thenReturn(MovieEmpty());
      final errorText = find.text('Failed');

      await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: id)));

      expect(errorText, findsOneWidget);
    });

    testWidgets(
        'should display Icon Check when state is MovieDetailHasData and MovieStatusState(true)',
        (WidgetTester tester) async {
      when(() => mockMovieDetailBloc.state)
          .thenReturn(MovieDetailHasData(tMovieDetail, tMovieList));
      when(() => mockWatchlistMoviesStatusBloc.state)
          .thenReturn(MovieStatusState(true));
      when(() => mockModifyWatchlistMoviesBloc.state).thenReturn(MovieEmpty());
      final iconCheck = find.byIcon(Icons.check);

      await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: id)));

      expect(iconCheck, findsOneWidget);
    });

    testWidgets(
        'should display Icon Add when state is MovieDetailHasData and MovieStatusState(false)',
        (WidgetTester tester) async {
      when(() => mockMovieDetailBloc.state)
          .thenReturn(MovieDetailHasData(tMovieDetail, tMovieList));
      when(() => mockWatchlistMoviesStatusBloc.state)
          .thenReturn(MovieStatusState(false));
      when(() => mockModifyWatchlistMoviesBloc.state).thenReturn(MovieEmpty());
      final iconCheck = find.byIcon(Icons.add);

      await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: id)));

      expect(iconCheck, findsOneWidget);
    });

    testWidgets('should display Snackbar when state is AddedMovie',
        (WidgetTester tester) async {
      when(() => mockMovieDetailBloc.state)
          .thenReturn(MovieDetailHasData(tMovieDetail, tMovieList));
      when(() => mockWatchlistMoviesStatusBloc.state)
          .thenReturn(MovieStatusState(false));
      when(() => mockModifyWatchlistMoviesBloc.state)
          .thenReturn(AddedMovie('Added to Watchlist'));
      whenListen(
          mockModifyWatchlistMoviesBloc,
          Stream.fromIterable([
            MovieLoading(),
            AddedMovie('Added to Watchlist'),
          ]));
      final watchlistButton = find.byType(ElevatedButton);

      await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

      expect(find.byIcon(Icons.add), findsOneWidget);

      await tester.tap(watchlistButton);
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Added to Watchlist'), findsOneWidget);
    });

    testWidgets('should display Snackbar when state is RemovedMovie',
        (WidgetTester tester) async {
      when(() => mockMovieDetailBloc.state)
          .thenReturn(MovieDetailHasData(tMovieDetail, tMovieList));
      when(() => mockWatchlistMoviesStatusBloc.state)
          .thenReturn(MovieStatusState(true));
      when(() => mockModifyWatchlistMoviesBloc.state)
          .thenReturn(RemovedMovie('Removed from Watchlist'));
      whenListen(
          mockModifyWatchlistMoviesBloc,
          Stream.fromIterable([
            MovieLoading(),
            RemovedMovie('Removed from Watchlist'),
          ]));
      final watchlistButton = find.byType(ElevatedButton);

      await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

      expect(find.byIcon(Icons.check), findsOneWidget);

      await tester.tap(watchlistButton);
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Removed from Watchlist'), findsOneWidget);
    });

    testWidgets(
        'should display AlertDialog when state is ModifyWatchlistMovieError',
        (WidgetTester tester) async {
      when(() => mockMovieDetailBloc.state)
          .thenReturn(MovieDetailHasData(tMovieDetail, tMovieList));
      when(() => mockWatchlistMoviesStatusBloc.state)
          .thenReturn(MovieStatusState(false));
      when(() => mockModifyWatchlistMoviesBloc.state)
          .thenReturn(ModifyWatchlistMovieError('Failed'));
      whenListen(
          mockModifyWatchlistMoviesBloc,
          Stream.fromIterable([
            MovieLoading(),
            ModifyWatchlistMovieError('Failed'),
          ]));
      final watchlistButton = find.byType(ElevatedButton);

      await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

      expect(find.byIcon(Icons.add), findsOneWidget);

      await tester.tap(watchlistButton, warnIfMissed: false);
      await tester.pump();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Failed'), findsOneWidget);
    });
  });
}
