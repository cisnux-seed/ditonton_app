import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/usecases/tv/get_popular_tv.dart';
import 'package:equatable/equatable.dart';

part 'popular_tv_event.dart';
part 'popular_tv_state.dart';

class PopularTvBloc extends Bloc<PopularTvEvent, PopularTvState> {
  final GetPopularTv getPopularTv;

  PopularTvBloc(this.getPopularTv) : super(PopularTvEmpty()) {
    on<FetchPopularTv>(_fetchPopularTv);
  }

  void _fetchPopularTv(
    FetchPopularTv event,
    Emitter<PopularTvState> emit,
  ) async {
    emit(PopularTvLoading());
    final result = await getPopularTv.execute();
    result.fold(
      (failure) => emit(PopularTvError(failure.message)),
      (data) => emit(PopularTvHasData(data)),
    );
  }
}
