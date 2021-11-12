import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/usecases/movies/get_popular_movies.dart';
import 'package:equatable/equatable.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;

  PopularMoviesBloc(this.getPopularMovies) : super(PopularMoviesEmpty()) {
    on<FetchPopularMovies>(_fetchPopularMovies);
  }

  void _fetchPopularMovies(
    FetchPopularMovies event,
    Emitter<PopularMoviesState> emit,
  ) async {
    emit(PopularMoviesLoading());
    final result = await getPopularMovies.execute();
    result.fold(
      (failure) => emit(PopularMoviesError(failure.message)),
      (data) => emit(PopularMoviesHasData(data)),
    );
  }
}
