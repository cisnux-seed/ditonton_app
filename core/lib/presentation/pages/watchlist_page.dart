import 'package:core/presentation/pages/tv/watchlist_tv_page.dart';
import 'movies/watchlist_movies_page.dart';
import 'package:flutter/material.dart';
import '../../core.dart';

class WatchlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Watchlist'),
          bottom: const TabBar(
            indicatorColor: kMikadoYellow,
            tabs: [
              Tab(icon: Icon(Icons.movie_creation_rounded)),
              Tab(icon: Icon(Icons.live_tv_rounded)),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TabBarView(children: [
            WatchlistMovies(),
            WatchlistTv(),
          ]),
        ),
      ),
    );
  }
}
