import 'package:core/presentation/bloc/movies/popular_movies_bloc.dart';
import 'package:core/presentation/pages/movies/popular_movies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../dummy_data/dummy_objects.dart';
import 'popular_movies_page_mocks.dart';

void main() {
  late final MockPopularMoviesBloc mockPopularMoviesBloc;

  setUpAll(() {
    registerFallbackValue(PopularMoviesStateFake());
    registerFallbackValue(PopularMoviesEventFake());

    mockPopularMoviesBloc = MockPopularMoviesBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<PopularMoviesBloc>.value(
      value: mockPopularMoviesBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  group('popular movies page', () {
    testWidgets(
        'should display CircularProgressIndicator when state is PopularMoviesLoading',
        (WidgetTester tester) async {
      when(() => mockPopularMoviesBloc.state)
          .thenReturn(PopularMoviesLoading());
      final title = find.text('Popular Movies');
      final circularProgressIndicator = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget(PopularMoviesPage()));

      expect(circularProgressIndicator, findsOneWidget);
      expect(title, findsOneWidget);
    });

    testWidgets('should display ListView when state is PopularMoviesHasData',
        (WidgetTester tester) async {
      when(() => mockPopularMoviesBloc.state)
          .thenReturn(PopularMoviesHasData(tMovieList));
      final title = find.text('Popular Movies');
      final listView = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(PopularMoviesPage()));

      expect(listView, findsOneWidget);
      expect(title, findsOneWidget);
    });

    testWidgets(
        "should display Text('Failed') when state is PopularMoviesError",
        (WidgetTester tester) async {
      when(() => mockPopularMoviesBloc.state)
          .thenReturn(PopularMoviesError('Failed'));
      final title = find.text('Popular Movies');
      final errorText = find.text('Failed');

      await tester.pumpWidget(_makeTestableWidget(PopularMoviesPage()));

      expect(errorText, findsOneWidget);
      expect(title, findsOneWidget);
    });
  });
}
