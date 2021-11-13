part of 'show_watchlist_movies_bloc.dart';

abstract class ShowWatchlistMoviesState extends Equatable {}

class ShowWatchlistMoviesEmpty extends ShowWatchlistMoviesState {
  @override
  List<Object> get props => [];
}

class ShowWatchlistMoviesLoading extends ShowWatchlistMoviesState {
  @override
  List<Object> get props => [];
}

class ShowWatchlistMoviesHasData extends ShowWatchlistMoviesState {
  final List<Movie> movies;

  ShowWatchlistMoviesHasData(this.movies);

  @override
  List<Object> get props => [movies];
}

class ShowWatchlistMoviesError extends ShowWatchlistMoviesState {
  final String message;

  ShowWatchlistMoviesError(this.message);

  @override
  List<Object> get props => [message];
}
