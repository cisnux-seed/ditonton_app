import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';
import 'package:tv_series/domain/usecases/remove_watchlist_tv.dart';
import 'package:tv_series/domain/usecases/save_watchlist_tv.dart';

part 'modify_watchlist_tv_event.dart';
part 'modify_watchlist_tv_state.dart';

class ModifyWatchlistTvBloc
    extends Bloc<ModifyWatchlistTvEvent, ModifyWatchlistTvState> {
  final SaveWatchlistTv saveWatchlistTv;
  final RemoveWatchlistTv removeWatchlistTv;

  ModifyWatchlistTvBloc({
    required this.saveWatchlistTv,
    required this.removeWatchlistTv,
  }) : super(TvEmpty()) {
    on<AddTv>(_addWatchlistTv);
    on<RemoveTv>(_removeWatchlistTv);
  }

  void _addWatchlistTv(
    AddTv event,
    Emitter<ModifyWatchlistTvState> emit,
  ) async {
    emit(TvLoading());
    final result = await saveWatchlistTv.execute(event.tvDetail);

    result.fold(
      (failure) => emit(ModifyWatchlistTvError(failure.message)),
      (successMessage) => emit(AddedTv(successMessage)),
    );
  }

  void _removeWatchlistTv(
    RemoveTv event,
    Emitter<ModifyWatchlistTvState> emit,
  ) async {
    emit(TvLoading());
    final result = await removeWatchlistTv.execute(event.tvDetail);

    result.fold(
      (failure) => emit(ModifyWatchlistTvError(failure.message)),
      (successMessage) => emit(RemovedTv(successMessage)),
    );
  }
}
