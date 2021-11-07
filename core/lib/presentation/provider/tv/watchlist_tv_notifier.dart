import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/usecases/tv/get_watchlist_tv.dart';
import 'package:flutter/foundation.dart';
import '../../../core.dart';

class WatchlistTvNotifier extends ChangeNotifier {
  var _watchlistTv = <Tv>[];
  List<Tv> get watchlistTv => _watchlistTv;

  var _watchlistState = RequestState.Empty;
  RequestState get watchlistState => _watchlistState;

  String _message = '';
  String get message => _message;

  WatchlistTvNotifier({required this.getWatchlistTv});

  final GetWatchlistTv getWatchlistTv;

  Future<void> fetchWatchlistTv() async {
    _watchlistState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistTv.execute();
    result.fold(
      (failure) {
        _watchlistState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvData) {
        _watchlistTv = tvData;
        _watchlistState =
            _watchlistTv.isNotEmpty ? RequestState.Loaded : RequestState.Empty;
        notifyListeners();
      },
    );
  }
}
