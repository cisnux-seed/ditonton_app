import 'package:core/presentation/widgets/custom_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:movies/presentation/bloc/now_playing_movies_bloc.dart';
import 'package:movies/presentation/bloc/popular_movies_bloc.dart';
import 'package:movies/presentation/bloc/top_rated_movies_bloc.dart';
import 'package:movies/presentation/pages/home_movie.dart';
import 'package:tv_series/presentation/bloc/on_the_air_tv_bloc.dart';
import 'package:tv_series/presentation/bloc/popular_tv_bloc.dart';
import 'package:tv_series/presentation/bloc/top_rated_tv_bloc.dart';
import 'package:tv_series/presentation/pages/home_tv.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<NowPlayingMoviesBloc>(context)
        ..add(FetchNowPlayingMovies());
      BlocProvider.of<PopularMoviesBloc>(context)..add(FetchPopularMovies());
      BlocProvider.of<TopRatedMoviesBloc>(context)..add(FetchTopRatedMovies());
      BlocProvider.of<OnTheAirTvBloc>(context)..add(FetchOnTheAirTv());
      BlocProvider.of<PopularTvBloc>(context)..add(FetchPopularTv());
      BlocProvider.of<TopRatedTvBloc>(context)..add(FetchTopRatedTv());
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      content: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          title: const Text('Ditonton'),
          actions: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, SEARCH_ROUTE),
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeMovie(),
                HomeTv(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
