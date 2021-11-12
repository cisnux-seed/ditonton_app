import 'package:core/presentation/bloc/movies/show_watchlist_movies_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

class MockShowWatchlistMoviesBloc
    extends MockBloc<ShowWatchlistMoviesEvent, ShowWatchlistMoviesState>
    implements ShowWatchlistMoviesBloc {}

class ShowWatchlistMoviesStateFake extends Fake
    implements ShowWatchlistMoviesState {}

class ShowWatchlistMoviesEventFake extends Fake
    implements ShowWatchlistMoviesEvent {}
