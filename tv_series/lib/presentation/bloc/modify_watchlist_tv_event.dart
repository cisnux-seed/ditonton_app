part of 'modify_watchlist_tv_bloc.dart';

abstract class ModifyWatchlistTvEvent extends Equatable {}

class AddTv extends ModifyWatchlistTvEvent {
  final TvDetail tvDetail;

  AddTv(this.tvDetail);

  @override
  List<Object> get props => [tvDetail];
}

class RemoveTv extends ModifyWatchlistTvEvent {
  final TvDetail tvDetail;

  RemoveTv(this.tvDetail);

  @override
  List<Object> get props => [tvDetail];
}
