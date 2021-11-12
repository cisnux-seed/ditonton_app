import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/usecases/tv/get_on_the_air_tv.dart';
import 'package:equatable/equatable.dart';

part 'on_the_air_tv_event.dart';
part 'on_the_air_tv_state.dart';

class OnTheAirTvBloc extends Bloc<OnTheAirTvEvent, OnTheAirTvState> {
  final GetOnTheAirTv getOnTheAirTv;

  OnTheAirTvBloc(this.getOnTheAirTv) : super(OnTheAirTvEmpty()) {
    on<FetchOnTheAirTv>(_fetchOnTheAirTv);
  }

  void _fetchOnTheAirTv(
    FetchOnTheAirTv event,
    Emitter<OnTheAirTvState> emit,
  ) async {
    emit(OnTheAirTvLoading());
    final result = await getOnTheAirTv.execute();
    result.fold(
      (failure) => emit(OnTheAirTvError(failure.message)),
      (data) => emit(OnTheAirTvHasData(data)),
    );
  }
}