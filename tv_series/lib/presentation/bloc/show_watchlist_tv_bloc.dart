import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/usecases/get_watchlist_tv.dart';

part 'show_watchlist_tv_event.dart';
part 'show_watchlist_tv_state.dart';

class ShowWatchlistTvBloc
    extends Bloc<ShowWatchlistTvEvent, ShowWatchlistTvState> {
  final GetWatchlistTv getWatchlistTv;

  ShowWatchlistTvBloc(this.getWatchlistTv) : super(ShowWatchlistTvEmpty()) {
    on<FetchWatchlistTv>(_fetchWatchlistTv);
  }

  void _fetchWatchlistTv(
    FetchWatchlistTv event,
    Emitter<ShowWatchlistTvState> emit,
  ) async {
    emit(ShowWatchlistTvLoading());
    final result = await getWatchlistTv.execute();
    result.fold(
      (failure) => emit(ShowWatchlistTvError(failure.message)),
      (data) => data.isNotEmpty
          ? emit(ShowWatchlistTvHasData(data))
          : emit(ShowWatchlistTvEmpty()),
    );
  }
}
