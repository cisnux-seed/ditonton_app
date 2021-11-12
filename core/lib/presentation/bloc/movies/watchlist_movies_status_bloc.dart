import 'package:bloc/bloc.dart';
import 'package:core/domain/usecases/movies/get_watchlist_status.dart';
import 'package:equatable/equatable.dart';

part 'watchlist_movies_status_event.dart';
part 'watchlist_movies_status_state.dart';

class WatchlistMoviesStatusBloc
    extends Bloc<WatchlistMoviesStatusEvent, WatchlistMoviesStatusState> {
  final GetWatchListMoviesStatus getWatchlistMoviesStatus;

  WatchlistMoviesStatusBloc(this.getWatchlistMoviesStatus)
      : super(MovieStatusEmpty()) {
    on<FetchMovieStatus>(_fetchMovieStatus);
  }

  void _fetchMovieStatus(
    FetchMovieStatus event,
    Emitter<WatchlistMoviesStatusState> emit,
  ) async {
    final result = await getWatchlistMoviesStatus.execute(event.id);
    emit(MovieStatusState(result));
  }
}
