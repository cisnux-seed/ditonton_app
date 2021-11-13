part of 'modify_watchlist_tv_bloc.dart';

abstract class ModifyWatchlistTvState extends Equatable {}

class TvEmpty extends ModifyWatchlistTvState {
  @override
  List<Object> get props => [];
}

class TvLoading extends ModifyWatchlistTvState {
  @override
  List<Object> get props => [];
}

class AddedTv extends ModifyWatchlistTvState {
  final String message;

  AddedTv(this.message);

  @override
  List<Object> get props => [message];
}

class RemovedTv extends ModifyWatchlistTvState {
  final String message;

  RemovedTv(this.message);

  @override
  List<Object> get props => [message];
}

class ModifyWatchlistTvError extends ModifyWatchlistTvState {
  final String message;

  ModifyWatchlistTvError(this.message);

  @override
  List<Object> get props => [message];
}
