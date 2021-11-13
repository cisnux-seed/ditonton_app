import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/presentation/bloc/top_rated_movies_bloc.dart';
import 'package:movies/presentation/pages/top_rated_movies_page.dart';
import '../../dummy_data/dummy_objects.dart';
import 'top_rated_movies_page_test_mocks.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';

void main() {
  late final MockTopRatedMoviesBloc mockTopRatedMoviesBloc;

  setUpAll(() {
    registerFallbackValue(TopRatedMoviesStateFake());
    registerFallbackValue(TopRatedMoviesEventFake());

    mockTopRatedMoviesBloc = MockTopRatedMoviesBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<TopRatedMoviesBloc>.value(
      value: mockTopRatedMoviesBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  group('top rated movies page', () {
    testWidgets(
        'should display CircularProgressIndicator when state is TopRatedMoviesLoading',
        (WidgetTester tester) async {
      when(() => mockTopRatedMoviesBloc.state)
          .thenReturn(TopRatedMoviesLoading());
      final title = find.text('Top Rated Movies');
      final circularProgressIndicator = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

      expect(circularProgressIndicator, findsOneWidget);
      expect(title, findsOneWidget);
    });

    testWidgets('should display ListView when state is TopRatedMoviesHasData',
        (WidgetTester tester) async {
      when(() => mockTopRatedMoviesBloc.state)
          .thenReturn(TopRatedMoviesHasData(tMovieList));
      final title = find.text('Top Rated Movies');
      final listView = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

      expect(listView, findsOneWidget);
      expect(title, findsOneWidget);
    });

    testWidgets(
        "should display Text('Failed') when state is TopRatedMoviesError",
        (WidgetTester tester) async {
      when(() => mockTopRatedMoviesBloc.state)
          .thenReturn(TopRatedMoviesError('Failed'));
      final title = find.text('Top Rated Movies');
      final errorText = find.text('Failed');

      await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

      expect(errorText, findsOneWidget);
      expect(title, findsOneWidget);
    });
  });
}
