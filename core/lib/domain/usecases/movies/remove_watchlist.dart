import 'package:core/domain/entities/movie_detail.dart';
import 'package:core/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../core.dart';

class RemoveWatchlistMovies {
  final MovieRepository repository;

  RemoveWatchlistMovies(this.repository);

  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.removeWatchlistMovies(movie);
  }
}
