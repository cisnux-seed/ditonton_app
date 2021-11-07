import 'package:core/data/models/tv_table.dart';
import 'db/database_helper.dart';
import '../../core.dart';

abstract class TvLocalDataSource {
  Future<String> insertWatchlistTv(TvTable tv);
  Future<String> removeWatchlistTv(TvTable tv);
  Future<TvTable?> getTvById(int id);
  Future<List<TvTable>> getWatchlistTv();
  Future<void> cacheOnTheAirTv(List<TvTable> tv);
  Future<List<TvTable>> getCachedOnTheAirTv();
  Future<void> cachePopularTv(List<TvTable> tv);
  Future<List<TvTable>> getCachedPopularTv();
  Future<void> cacheTopRatedTv(List<TvTable> tv);
  Future<List<TvTable>> getCachedTopRatedTv();
}

class TvLocalDataSourceImpl implements TvLocalDataSource {
  final DatabaseHelper databaseHelper;

  TvLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> insertWatchlistTv(TvTable tv) async {
    try {
      await databaseHelper.insertWatchlistTv(tv);
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlistTv(TvTable tv) async {
    try {
      await databaseHelper.removeWatchlistTv(tv);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<TvTable?> getTvById(int id) async {
    final result = await databaseHelper.getTvById(id);
    if (result != null) {
      return TvTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<TvTable>> getWatchlistTv() async {
    final result = await databaseHelper.getWatchlistTv();
    return result.map((data) => TvTable.fromMap(data)).toList();
  }

  @override
  Future<void> cacheOnTheAirTv(List<TvTable> tv) async {
    await databaseHelper.clearCacheTv('on the air');
    await databaseHelper.insertCacheTransactionTv(tv, 'on the air');
  }

  @override
  Future<List<TvTable>> getCachedOnTheAirTv() async {
    final result = await databaseHelper.getCacheTv('on the air');
    if (result.isNotEmpty) {
      return result.map((data) => TvTable.fromMap(data)).toList();
    } else {
      throw CacheException("Can't get the data :(");
    }
  }

  @override
  Future<void> cachePopularTv(List<TvTable> tv) async {
    await databaseHelper.clearCacheTv('popular tv');
    await databaseHelper.insertCacheTransactionTv(tv, 'popular tv');
  }

  @override
  Future<void> cacheTopRatedTv(List<TvTable> tv) async {
    await databaseHelper.clearCacheTv('top rated tv');
    await databaseHelper.insertCacheTransactionTv(
      tv,
      'top rated tv',
    );
  }

  @override
  Future<List<TvTable>> getCachedPopularTv() async {
    final result = await databaseHelper.getCacheTv('popular tv');
    if (result.length > 0) {
      return result.map((data) => TvTable.fromMap(data)).toList();
    } else {
      throw CacheException("Can't get the data :(");
    }
  }

  @override
  Future<List<TvTable>> getCachedTopRatedTv() async {
    final result = await databaseHelper.getCacheTv('top rated tv');
    if (result.isNotEmpty) {
      return result.map((data) => TvTable.fromMap(data)).toList();
    } else {
      throw CacheException("Can't get the data :(");
    }
  }
}
