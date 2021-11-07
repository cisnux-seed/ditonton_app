import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:search/presentation/bloc/movies/movies_search_bloc.dart';
import 'package:search/presentation/bloc/tv/tv_search_bloc.dart';
import 'package:search/search.dart';

class MockMoviesSearchBloc
    extends MockBloc<MoviesSearchEvent, MoviesSearchState>
    implements MoviesSearchBloc {}

class MoviesSearchStateFake extends Fake implements MoviesSearchState {}

class MoviesSearchEventFake extends Fake implements MoviesSearchEvent {}

class MockTvSearchBloc extends MockBloc<TvSearchEvent, TvSearchState>
    implements TvSearchBloc {}

class TvSearchStateFake extends Fake implements TvSearchState {}

class TvSearchEventFake extends Fake implements TvSearchEvent {}
