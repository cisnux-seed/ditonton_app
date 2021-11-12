part of 'tv_detail_bloc.dart';

abstract class TvDetailState extends Equatable {}

class TvDetailEmpty extends TvDetailState {
  @override
  List<Object> get props => [];
}

class TvDetailLoading extends TvDetailState {
  @override
  List<Object> get props => [];
}

class TvDetailError extends TvDetailState {
  final String message;

  TvDetailError(this.message);

  @override
  List<Object> get props => [message];
}

class TvDetailHasData extends TvDetailState {
  final TvDetail tvDetail;
  final List<Tv> tvRecommendations;

  TvDetailHasData(this.tvDetail, this.tvRecommendations);

  @override
  List<Object> get props => [tvDetail, tvRecommendations];
}
