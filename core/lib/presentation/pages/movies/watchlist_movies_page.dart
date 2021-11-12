import 'package:core/presentation/bloc/movies/show_watchlist_movies_bloc.dart';
import 'package:core/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ShowWatchlistMoviesBloc, ShowWatchlistMoviesState>(
        builder: (context, state) {
          if (state is ShowWatchlistMoviesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ShowWatchlistMoviesHasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return MovieCard(movie);
              },
              itemCount: state.movies.length,
            );
          } else if (state is ShowWatchlistMoviesEmpty) {
            return Center(
              child: Text("You Don't Have Watchlist Movies"),
            );
          } else {
            return Center(
              child: Text((state as ShowWatchlistMoviesError).message),
            );
          }
        },
      ),
    );
  }
}
