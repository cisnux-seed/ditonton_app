import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie_detail.dart';
import 'package:core/domain/usecases/movies/remove_watchlist.dart';
import 'package:core/domain/usecases/movies/save_watchlist.dart';
import 'package:equatable/equatable.dart';

part 'modify_watchlist_movies_event.dart';
part 'modify_watchlist_movies_state.dart';

class ModifyWatchlistMoviesBloc
    extends Bloc<ModifyWatchlistMoviesEvent, ModifyWatchlistMoviesState> {
  final SaveWatchlistMovies saveWatchlistMovies;
  final RemoveWatchlistMovies removeWatchlistMovies;

  ModifyWatchlistMoviesBloc({
    required this.saveWatchlistMovies,
    required this.removeWatchlistMovies,
  }) : super(MovieEmpty()) {
    on<AddMovie>(_addWatchlistMovie);
    on<RemoveMovie>(_removeWatchlistMovie);
  }

  void _addWatchlistMovie(
    AddMovie event,
    Emitter<ModifyWatchlistMoviesState> emit,
  ) async {
    emit(MovieLoading());
    final result = await saveWatchlistMovies.execute(event.movieDetail);

    result.fold(
      (failure) => emit(ModifyWatchlistMovieError(failure.message)),
      (successMessage) => emit(AddedMovie(successMessage)),
    );
  }

  void _removeWatchlistMovie(
    RemoveMovie event,
    Emitter<ModifyWatchlistMoviesState> emit,
  ) async {
    emit(MovieLoading());
    final result = await removeWatchlistMovies.execute(event.movieDetail);

    result.fold(
      (failure) => emit(ModifyWatchlistMovieError(failure.message)),
      (successMessage) => emit(RemovedMovie(successMessage)),
    );
  }
}
