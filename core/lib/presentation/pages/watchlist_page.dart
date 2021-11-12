import 'package:core/presentation/bloc/movies/show_watchlist_movies_bloc.dart';
import 'package:core/presentation/bloc/tv/show_watchlist_tv_bloc.dart';
import 'package:core/presentation/pages/tv/watchlist_tv_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'movies/watchlist_movies_page.dart';
import 'package:flutter/material.dart';
import '../../core.dart';

class WatchlistPage extends StatefulWidget {
  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        BlocProvider.of<ShowWatchlistTvBloc>(context).add(FetchWatchlistTv()));
    Future.microtask(() => BlocProvider.of<ShowWatchlistMoviesBloc>(context)
        .add(FetchWatchlistMovies()));
  }

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
          child: TabBarView(
            children: [
              WatchlistMovies(),
              WatchlistTv(),
            ],
          ),
        ),
      ),
    );
  }
}
