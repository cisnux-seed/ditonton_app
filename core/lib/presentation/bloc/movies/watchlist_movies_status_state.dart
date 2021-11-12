part of 'watchlist_movies_status_bloc.dart';

abstract class WatchlistMoviesStatusState extends Equatable {}

class MovieStatusEmpty extends WatchlistMoviesStatusState {
  @override
  List<Object> get props => [];
}

class MovieStatusState extends WatchlistMoviesStatusState {
  final bool isAddedToWatchlist;

  MovieStatusState(this.isAddedToWatchlist);

  @override
  List<Object> get props => [isAddedToWatchlist];
}
