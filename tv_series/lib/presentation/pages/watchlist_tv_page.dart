import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/bloc/show_watchlist_tv_bloc.dart';
import 'package:tv_series/presentation/widgets/tv_card_list.dart';

class WatchlistTv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ShowWatchlistTvBloc, ShowWatchlistTvState>(
        builder: (context, state) {
          if (state is ShowWatchlistTvLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ShowWatchlistTvHasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final tv = state.tv[index];
                return TvCard(tv);
              },
              itemCount: state.tv.length,
            );
          } else if (state is ShowWatchlistTvEmpty) {
            return Center(
              child: Text("You Don't Have Watchlist Tv Series"),
            );
          } else {
            return Center(
              child: Text((state as ShowWatchlistTvError).message),
            );
          }
        },
      ),
    );
  }
}
