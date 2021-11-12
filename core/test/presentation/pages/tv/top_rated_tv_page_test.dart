import 'package:core/presentation/bloc/tv/top_rated_tv_bloc.dart';
import 'package:core/presentation/pages/tv/top_rated_tv_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../dummy_data/dummy_objects.dart';
import 'top_rated_tv_page_test_mocks.dart';

void main() {
  late final MockTopRatedTvBloc mockTopRatedTvBloc;

  setUpAll(() {
    registerFallbackValue(TopRatedTvStateFake());
    registerFallbackValue(TopRatedTvEventFake());

    mockTopRatedTvBloc = MockTopRatedTvBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<TopRatedTvBloc>.value(
      value: mockTopRatedTvBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  group('top rated tv series page', () {
    testWidgets(
        'should display CircularProgressIndicator when state is TopRatedTvLoading',
        (WidgetTester tester) async {
      when(() => mockTopRatedTvBloc.state).thenReturn(TopRatedTvLoading());
      final title = find.text('Top Rated Tv Series');
      final circularProgressIndicator = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget(TopRatedTvPage()));

      expect(circularProgressIndicator, findsOneWidget);
      expect(title, findsOneWidget);
    });

    testWidgets('should display ListView when state is TopRatedTvHasData',
        (WidgetTester tester) async {
      when(() => mockTopRatedTvBloc.state)
          .thenReturn(TopRatedTvHasData(tTvList));
      final title = find.text('Top Rated Tv Series');
      final listView = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(TopRatedTvPage()));

      expect(listView, findsOneWidget);
      expect(title, findsOneWidget);
    });

    testWidgets("should display Text('Failed') when state is TopRatedTvError",
        (WidgetTester tester) async {
      when(() => mockTopRatedTvBloc.state)
          .thenReturn(TopRatedTvError('Failed'));
      final title = find.text('Top Rated Tv Series');
      final errorText = find.text('Failed');

      await tester.pumpWidget(_makeTestableWidget(TopRatedTvPage()));

      expect(errorText, findsOneWidget);
      expect(title, findsOneWidget);
    });
  });
}
