import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:search/presentation/bloc/movies/movies_search_bloc.dart';
import 'package:search/presentation/bloc/tv/tv_search_bloc.dart';
import 'package:search/search.dart';
import 'search_page_test_mocks.dart';

void main() {
  late final MockMoviesSearchBloc mockMoviesSearchBloc;
  late final MockTvSearchBloc mockTvSearchBloc;

  setUpAll(() {
    registerFallbackValue(MoviesSearchStateFake());
    registerFallbackValue(MoviesSearchEventFake());
    registerFallbackValue(TvSearchStateFake());
    registerFallbackValue(TvSearchEventFake());

    mockMoviesSearchBloc = MockMoviesSearchBloc();
    mockTvSearchBloc = MockTvSearchBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<MoviesSearchBloc>.value(
      value: mockMoviesSearchBloc,
      child: BlocProvider<TvSearchBloc>.value(
        value: mockTvSearchBloc,
        child: MaterialApp(
          home: body,
        ),
      ),
    );
  }

  final tMovie = Movie(
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: const [14, 28],
    id: 557,
    originalTitle: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    releaseDate: '2002-05-01',
    title: 'Spider-Man',
    video: false,
    voteAverage: 7.2,
    voteCount: 13507,
  );

  final tMovieList = [tMovie];

  final tTv = Tv(
    backdropPath: '/oaGvjB0DvdhXhOAuADfHb261ZHa.jpg',
    genreIds: const [10759, 9648, 18],
    id: 9340,
    overview:
        "Hundreds of cash-strapped players accept a strange invitation to compete in children's games—with high stakes. But, a tempting prize awaits the victor.",
    popularity: 60.441,
    posterPath: '/dDlEmu3EZ0Pgg93K2SVNLCjCSvE.jpg',
    voteAverage: 7.8,
    voteCount: 7893,
    firstAirDate: '2021-09-17',
    name: 'Squid Game',
    originalLanguage: 'ko',
    originalName: '오징어 게임',
    originCountry: const ["KR"],
  );

  final tTvList = [tTv];

  group('Search Page', () {
    testWidgets(
        'should display CircularProgressIndicator when states is MoviesSearchLoading and TvSearchLoading',
        (WidgetTester tester) async {
      when(() => mockMoviesSearchBloc.state).thenReturn(MoviesSearchLoading());
      when(() => mockTvSearchBloc.state).thenReturn(TvSearchLoading());

      final circularProgressIndicator = find.byType(CircularProgressIndicator);
      await tester.pumpWidget(_makeTestableWidget(SearchPage()));

      final textField = find.byKey(Key('search-textfield'));
      final queryText = find.text('batman');

      await tester.enterText(textField, 'batman');
      await tester.testTextInput.receiveAction(TextInputAction.search);

      expect(circularProgressIndicator, findsOneWidget);
      expect(queryText, findsOneWidget);
    });

    testWidgets('should display ListView when result is not empty',
        (WidgetTester tester) async {
      when(() => mockMoviesSearchBloc.state)
          .thenReturn(MoviesSearchHasData(tMovieList));
      when(() => mockTvSearchBloc.state).thenReturn(TvSearchHasData(tTvList));

      final searchList = find.byKey(Key('search-listview'));
      await tester.pumpWidget(_makeTestableWidget(SearchPage()));

      final textField = find.byKey(Key('search-textfield'));
      final queryText = find.text('batman');

      await tester.enterText(textField, 'batman');
      await tester.testTextInput.receiveAction(TextInputAction.search);

      expect(searchList, findsOneWidget);
      expect(queryText, findsOneWidget);
    });

    testWidgets(
        "should display 'Cannot Found Movies and Tv Series :(' when result is empty",
        (WidgetTester tester) async {
      when(() => mockMoviesSearchBloc.state)
          .thenReturn(MoviesSearchHasData([]));
      when(() => mockTvSearchBloc.state).thenReturn(TvSearchHasData([]));

      final text = find.text('Cannot Found Movies and Tv Series :(');
      await tester.pumpWidget(_makeTestableWidget(SearchPage()));

      final textField = find.byKey(Key('search-textfield'));
      final queryText = find.text('batman');

      await tester.enterText(textField, 'batman');
      await tester.testTextInput.receiveAction(TextInputAction.search);

      expect(text, findsOneWidget);
      expect(queryText, findsOneWidget);
    });

    testWidgets(
        "should not display anything when states is TvSearchError and MoviesSearchError",
        (WidgetTester tester) async {
      when(() => mockMoviesSearchBloc.state).thenReturn(MoviesSearchError(''));
      when(() => mockTvSearchBloc.state).thenReturn(TvSearchError(''));

      await tester.pumpWidget(_makeTestableWidget(SearchPage()));

      final error = find.byKey(Key('search-error'));
      final textField = find.byKey(Key('search-textfield'));
      final queryText = find.text('batman');

      await tester.enterText(textField, 'batman');
      await tester.testTextInput.receiveAction(TextInputAction.search);

      expect(error, findsOneWidget);
      expect(queryText, findsOneWidget);
    });
  });
}
