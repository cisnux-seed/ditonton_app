import 'package:bloc_test/bloc_test.dart';
import 'package:core/presentation/bloc/movies/modify_watchlist_movies_bloc.dart';
import 'package:core/presentation/bloc/movies/movie_detail_bloc.dart';
import 'package:core/presentation/bloc/movies/watchlist_movies_status_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockMovieDetailBloc extends MockBloc<MovieDetailEvent, MovieDetailState>
    implements MovieDetailBloc {}

class MovieDetailStateFake extends Fake implements MovieDetailState {}

class MovieDetailEventFake extends Fake implements MovieDetailEvent {}

class MockModifyWatchlistMoviesBloc
    extends MockBloc<ModifyWatchlistMoviesEvent, ModifyWatchlistMoviesState>
    implements ModifyWatchlistMoviesBloc {}

class ModifyWatchlistMoviesStateFake extends Fake
    implements ModifyWatchlistMoviesState {}

class ModifyWatchlistMoviesEventFake extends Fake
    implements ModifyWatchlistMoviesEvent {}

class MockWatchlistMoviesStatusBloc
    extends MockBloc<WatchlistMoviesStatusEvent, WatchlistMoviesStatusState>
    implements WatchlistMoviesStatusBloc {}

class WatchlistMoviesStatusStateFake extends Fake
    implements WatchlistMoviesStatusState {}

class WatchlistMoviesStatusEventFake extends Fake
    implements WatchlistMoviesStatusEvent {}
