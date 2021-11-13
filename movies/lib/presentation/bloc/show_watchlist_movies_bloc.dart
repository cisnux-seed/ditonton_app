import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/usecases/get_watchlist_movies.dart';

part 'show_watchlist_movies_event.dart';
part 'show_watchlist_movies_state.dart';

class ShowWatchlistMoviesBloc
    extends Bloc<ShowWatchlistMoviesEvent, ShowWatchlistMoviesState> {
  final GetWatchlistMovies getWatchlistMovies;

  ShowWatchlistMoviesBloc(this.getWatchlistMovies)
      : super(ShowWatchlistMoviesEmpty()) {
    on<FetchWatchlistMovies>(_fetchWatchlistMovies);
  }

  void _fetchWatchlistMovies(
    FetchWatchlistMovies event,
    Emitter<ShowWatchlistMoviesState> emit,
  ) async {
    emit(ShowWatchlistMoviesLoading());
    final result = await getWatchlistMovies.execute();
    result.fold(
      (failure) => emit(ShowWatchlistMoviesError(failure.message)),
      (data) => data.isNotEmpty
          ? emit(ShowWatchlistMoviesHasData(data))
          : emit(ShowWatchlistMoviesEmpty()),
    );
  }
}
