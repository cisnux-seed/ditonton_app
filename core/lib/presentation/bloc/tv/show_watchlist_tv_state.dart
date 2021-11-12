part of 'show_watchlist_tv_bloc.dart';

abstract class ShowWatchlistTvState extends Equatable {}

class ShowWatchlistTvEmpty extends ShowWatchlistTvState {
  @override
  List<Object> get props => [];
}

class ShowWatchlistTvLoading extends ShowWatchlistTvState {
  @override
  List<Object> get props => [];
}

class ShowWatchlistTvHasData extends ShowWatchlistTvState {
  final List<Tv> tv;

  ShowWatchlistTvHasData(this.tv);

  @override
  List<Object> get props => [tv];
}

class ShowWatchlistTvError extends ShowWatchlistTvState {
  final String message;

  ShowWatchlistTvError(this.message);

  @override
  List<Object> get props => [message];
}
