part of 'watchlist_movies_status_bloc.dart';

abstract class WatchlistMoviesStatusEvent extends Equatable {}

class FetchMovieStatus extends WatchlistMoviesStatusEvent {
  final int id;

  FetchMovieStatus(this.id);

  @override
  List<Object> get props => [id];
}
