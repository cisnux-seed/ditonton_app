import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/usecases/get_now_playing_movies.dart';

part 'now_playing_movies_event.dart';
part 'now_playing_movies_state.dart';

class NowPlayingMoviesBloc
    extends Bloc<NowPlayingMoviesEvent, NowPlayingMoviesState> {
  final GetNowPlayingMovies getNowPlayingMovies;

  NowPlayingMoviesBloc(this.getNowPlayingMovies)
      : super(NowPlayingMoviesEmpty()) {
    on<FetchNowPlayingMovies>(_fetchNowPlayingMovies);
  }

  void _fetchNowPlayingMovies(
      FetchNowPlayingMovies event, Emitter<NowPlayingMoviesState> emit) async {
    emit(NowPlayingMoviesLoading());
    final result = await getNowPlayingMovies.execute();
    result.fold(
      (failure) => emit(NowPlayingMoviesError(failure.message)),
      (data) => emit(NowPlayingMoviesHasData(data)),
    );
  }
}
