import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';
import 'package:tv_series/domain/usecases/get_tv_detail.dart';
import 'package:tv_series/domain/usecases/get_tv_recommendations.dart';

part 'tv_detail_event.dart';
part 'tv_detail_state.dart';

class TvDetailBloc extends Bloc<TvDetailEvent, TvDetailState> {
  final GetTvDetail getTvDetail;
  final GetTvRecommendations getTvRecommendations;

  TvDetailBloc({
    required this.getTvDetail,
    required this.getTvRecommendations,
  }) : super(TvDetailEmpty()) {
    on<FetchTvDetail>(_fetchTvDetail);
  }

  void _fetchTvDetail(
    FetchTvDetail event,
    Emitter<TvDetailState> emit,
  ) async {
    emit(TvDetailLoading());
    final detailResult = await getTvDetail.execute(event.id);
    final recommendationResult = await getTvRecommendations.execute(event.id);
    detailResult.fold(
      (failure) => emit(TvDetailError(failure.message)),
      (detailTv) {
        emit(TvDetailLoading());
        recommendationResult.fold(
          (failure) => emit(TvDetailError(failure.message)),
          (recommendationTv) => emit(
            TvDetailHasData(detailTv, recommendationTv),
          ),
        );
      },
    );
  }
}
