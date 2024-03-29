import 'package:tv_series/domain/repositories/tv_repository.dart';

class GetWatchListTvStatus {
  final TvRepository repository;

  GetWatchListTvStatus(this.repository);

  Future<bool> execute(int id) async {
    return repository.isAddedToWatchlistTv(id);
  }
}
