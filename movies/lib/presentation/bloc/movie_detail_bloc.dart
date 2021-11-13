import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/entities/movie_detail.dart';
import 'package:movies/domain/usecases/get_movie_detail.dart';
import 'package:movies/domain/usecases/get_movie_recommendations.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final GetMovieRecommendations getMovieRecommendations;

  MovieDetailBloc({
    required this.getMovieDetail,
    required this.getMovieRecommendations,
  }) : super((MovieDetailEmpty())) {
    on<FetchMovieDetail>(_fetchMovieDetail);
  }

  void _fetchMovieDetail(
    FetchMovieDetail event,
    Emitter<MovieDetailState> emit,
  ) async {
    emit(MovieDetailLoading());
    final detailResult = await getMovieDetail.execute(event.id);
    final recommendationResult =
        await getMovieRecommendations.execute(event.id);
    detailResult.fold(
      (failure) => emit(MovieDetailError(failure.message)),
      (detailMovie) {
        emit(MovieDetailLoading());
        recommendationResult.fold(
          (failure) => emit(MovieDetailError(failure.message)),
          (recommendationMovies) => emit(
            MovieDetailHasData(detailMovie, recommendationMovies),
          ),
        );
      },
    );
  }
}
