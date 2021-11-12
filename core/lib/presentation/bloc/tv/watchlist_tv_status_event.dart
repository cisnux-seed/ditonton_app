part of 'watchlist_tv_status_bloc.dart';

abstract class WatchlistTvStatusEvent extends Equatable {}

class FetchTvStatus extends WatchlistTvStatusEvent {
  final int id;

  FetchTvStatus(this.id);

  @override
  List<Object> get props => [id];
}
