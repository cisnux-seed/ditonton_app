part of 'modify_watchlist_movies_bloc.dart';

abstract class ModifyWatchlistMoviesEvent extends Equatable {}

class AddMovie extends ModifyWatchlistMoviesEvent {
  final MovieDetail movieDetail;

  AddMovie(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

class RemoveMovie extends ModifyWatchlistMoviesEvent {
  final MovieDetail movieDetail;

  RemoveMovie(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}
