import 'package:core/presentation/provider/tv/watchlist_tv_notifier.dart';
import 'package:core/presentation/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core.dart';

class WatchlistTv extends StatefulWidget {
  @override
  _WatchlistTvState createState() => _WatchlistTvState();
}

class _WatchlistTvState extends State<WatchlistTv> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<WatchlistTvNotifier>(context, listen: false)
            .fetchWatchlistTv());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<WatchlistTvNotifier>(
        builder: (context, data, child) {
          if (data.watchlistState == RequestState.Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (data.watchlistState == RequestState.Loaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final tv = data.watchlistTv[index];
                return TvCard(tv);
              },
              itemCount: data.watchlistTv.length,
            );
          } else if (data.watchlistState == RequestState.Empty) {
            return Center(
              child: Text("You Don't Have Watchlist Tv Series"),
            );
          } else {
            return Center(
              key: const Key('error_message'),
              child: Text(data.message),
            );
          }
        },
      ),
    );
  }
}
