import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:movies/presentation/bloc/show_watchlist_movies_bloc.dart';

class MockShowWatchlistMoviesBloc
    extends MockBloc<ShowWatchlistMoviesEvent, ShowWatchlistMoviesState>
    implements ShowWatchlistMoviesBloc {}

class ShowWatchlistMoviesStateFake extends Fake
    implements ShowWatchlistMoviesState {}

class ShowWatchlistMoviesEventFake extends Fake
    implements ShowWatchlistMoviesEvent {}
