import 'package:core/presentation/bloc/tv/popular_tv_bloc.dart';
import 'package:core/presentation/pages/tv/popular_tv_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../dummy_data/dummy_objects.dart';
import 'popular_tv_page_test_mocks.dart';

void main() {
  late final MockPopularTvBloc mockPopularTvBloc;

  setUpAll(() {
    registerFallbackValue(PopularTvStateFake());
    registerFallbackValue(PopularTvEventFake());

    mockPopularTvBloc = MockPopularTvBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<PopularTvBloc>.value(
      value: mockPopularTvBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  group('popular tv series page', () {
    testWidgets(
        'should display CircularProgressIndicator when state is PopularTvLoading',
        (WidgetTester tester) async {
      when(() => mockPopularTvBloc.state).thenReturn(PopularTvLoading());
      final title = find.text('Popular Tv Series');
      final circularProgressIndicator = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget(PopularTvPage()));

      expect(circularProgressIndicator, findsOneWidget);
      expect(title, findsOneWidget);
    });

    testWidgets('should display ListView when state is PopularTvHasData',
        (WidgetTester tester) async {
      when(() => mockPopularTvBloc.state).thenReturn(PopularTvHasData(tTvList));
      final title = find.text('Popular Tv Series');
      final listView = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(PopularTvPage()));

      expect(listView, findsOneWidget);
      expect(title, findsOneWidget);
    });

    testWidgets("should display Text('Failed') when state is PopularTvError",
        (WidgetTester tester) async {
      when(() => mockPopularTvBloc.state).thenReturn(PopularTvError('Failed'));
      final title = find.text('Popular Tv Series');
      final errorText = find.text('Failed');

      await tester.pumpWidget(_makeTestableWidget(PopularTvPage()));

      expect(errorText, findsOneWidget);
      expect(title, findsOneWidget);
    });
  });
}
