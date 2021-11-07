import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/entities/tv_detail.dart';
import 'package:dartz/dartz.dart';
import '../../core.dart';

abstract class TvRepository {
  Future<Either<Failure, List<Tv>>> getOnTheAirTv();
  Future<Either<Failure, List<Tv>>> getPopularTv();
  Future<Either<Failure, List<Tv>>> getTopRatedTv();
  Future<Either<Failure, TvDetail>> getTvDetail(int id);
  Future<Either<Failure, List<Tv>>> getTvRecommendations(int id);
  Future<Either<Failure, List<Tv>>> searchTv(String query);
  Future<Either<Failure, String>> saveWatchlistTv(TvDetail movie);
  Future<Either<Failure, String>> removeWatchlistTv(TvDetail movie);
  Future<bool> isAddedToWatchlistTv(int id);
  Future<Either<Failure, List<Tv>>> getWatchlistTv();
}
