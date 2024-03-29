part of 'tv_search_bloc.dart';

abstract class TvSearchEvent extends Equatable {
  const TvSearchEvent();
}

class TvOnQueryChanged extends TvSearchEvent {
  final String query;

  TvOnQueryChanged(this.query);

  @override
  List<Object> get props => [query];
}
