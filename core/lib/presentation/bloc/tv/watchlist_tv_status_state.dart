part of 'watchlist_tv_status_bloc.dart';

abstract class WatchlistTvStatusState extends Equatable {}

class TvStatusEmpty extends WatchlistTvStatusState {
  @override
  List<Object> get props => [];
}

class TvStatusState extends WatchlistTvStatusState {
  final bool isAddedToWatchlist;

  TvStatusState(this.isAddedToWatchlist);

  @override
  List<Object> get props => [isAddedToWatchlist];
}
