import 'package:core/presentation/bloc/tv/on_the_air_tv_bloc.dart';
import 'package:core/presentation/bloc/tv/top_rated_tv_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/presentation/bloc/tv/popular_tv_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/utils/routes.dart';
import 'package:flutter/material.dart';
import '../../../core.dart';

class HomeTv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'On The Air Tv Series',
            style: kHeading6,
          ),
        ),
        BlocBuilder<OnTheAirTvBloc, OnTheAirTvState>(
          builder: (_, state) {
            if (state is OnTheAirTvLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is OnTheAirTvHasData) {
              return TvList(state.result);
            } else {
              return Text('Failed');
            }
          },
        ),
        _buildSubHeading(
          title: 'Popular Tv Series',
          onTap: () => Navigator.pushNamed(context, POPULAR_TV_ROUTE),
        ),
        BlocBuilder<PopularTvBloc, PopularTvState>(
          builder: (_, state) {
            if (state is PopularTvLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PopularTvHasData) {
              return TvList(state.result);
            } else {
              return Text('Failed');
            }
          },
        ),
        _buildSubHeading(
          title: 'Top Rated Tv Series',
          onTap: () => Navigator.pushNamed(context, TOP_RATED_TV_ROUTE),
        ),
        BlocBuilder<TopRatedTvBloc, TopRatedTvState>(
          builder: (_, state) {
            if (state is TopRatedTvLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TopRatedTvHasData) {
              return TvList(state.result);
            } else {
              return Text('Failed');
            }
          },
        ),
      ],
    );
  }

  Padding _buildSubHeading({required String title, required Function() onTap}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: kHeading6,
          ),
          InkWell(
            onTap: onTap,
            child: Row(
              children: const [
                Text('See More'),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TvList extends StatelessWidget {
  final List<Tv> tvSeries;

  TvList(this.tvSeries);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tv = tvSeries[index];
          return Container(
            key: Key('tv-$index'),
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TV_DETAIL_ROUTE,
                  arguments: tv.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${tv.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvSeries.length,
      ),
    );
  }
}
