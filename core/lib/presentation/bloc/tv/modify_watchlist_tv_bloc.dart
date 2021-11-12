import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_detail.dart';
import 'package:core/domain/usecases/tv/remove_watchlist_tv.dart';
import 'package:core/domain/usecases/tv/save_watchlist_tv.dart';
import 'package:equatable/equatable.dart';

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
