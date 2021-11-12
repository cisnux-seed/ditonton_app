import 'package:bloc/bloc.dart';
import 'package:core/domain/usecases/tv/get_watchlist_status_tv.dart';
import 'package:equatable/equatable.dart';

part 'watchlist_tv_status_event.dart';
part 'watchlist_tv_status_state.dart';

class WatchlistTvStatusBloc
    extends Bloc<WatchlistTvStatusEvent, WatchlistTvStatusState> {
  final GetWatchListTvStatus getWatchlistTvStatus;

  WatchlistTvStatusBloc(this.getWatchlistTvStatus) : super(TvStatusEmpty()) {
    on<FetchTvStatus>(_fetchTvStatus);
  }

  void _fetchTvStatus(
    FetchTvStatus event,
    Emitter<WatchlistTvStatusState> emit,
  ) async {
    final result = await getWatchlistTvStatus.execute(event.id);
    emit(TvStatusState(result));
  }
}
