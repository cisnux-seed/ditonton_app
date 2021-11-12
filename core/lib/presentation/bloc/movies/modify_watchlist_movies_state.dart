part of 'modify_watchlist_movies_bloc.dart';

abstract class ModifyWatchlistMoviesState extends Equatable {}

class MovieEmpty extends ModifyWatchlistMoviesState {
  @override
  List<Object> get props => [];
}

class MovieLoading extends ModifyWatchlistMoviesState {
  @override
  List<Object> get props => [];
}

class AddedMovie extends ModifyWatchlistMoviesState {
  final String message;

  AddedMovie(this.message);

  @override
  List<Object> get props => [message];
}

class RemovedMovie extends ModifyWatchlistMoviesState {
  final String message;

  RemovedMovie(this.message);

  @override
  List<Object> get props => [message];
}

class ModifyWatchlistMovieError extends ModifyWatchlistMoviesState {
  final String message;

  ModifyWatchlistMovieError(this.message);

  @override
  List<Object> get props => [message];
}
