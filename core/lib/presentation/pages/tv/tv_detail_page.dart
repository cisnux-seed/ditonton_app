import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/presentation/bloc/tv/modify_watchlist_tv_bloc.dart';
import 'package:core/presentation/bloc/tv/tv_detail_bloc.dart';
import 'package:core/presentation/bloc/tv/watchlist_tv_status_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:core/domain/entities/tv_detail.dart';
import 'package:core/utils/format_content.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/utils/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../../../core.dart';

class TvDetailPage extends StatefulWidget {
  final int id;
  TvDetailPage({required this.id});

  @override
  _TvDetailPageState createState() => _TvDetailPageState();
}

class _TvDetailPageState extends State<TvDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        BlocProvider.of<TvDetailBloc>(context)..add(FetchTvDetail(widget.id));
        BlocProvider.of<WatchlistTvStatusBloc>(context)
          ..add(FetchTvStatus(widget.id));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ModifyWatchlistTvBloc, ModifyWatchlistTvState>(
      listenWhen: (_, state) =>
          state is AddedTv ||
          state is RemovedTv ||
          state is ModifyWatchlistTvError,
      listener: (context, state) {
        if (state is AddedTv) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is RemovedTv) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is ModifyWatchlistTvError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(state.message),
                );
              });
        }
      },
      child: Scaffold(
        body: BlocBuilder<TvDetailBloc, TvDetailState>(
          builder: (_, tv) =>
              BlocBuilder<WatchlistTvStatusBloc, WatchlistTvStatusState>(
            builder: (_, status) {
              if (tv is TvDetailHasData && status is TvStatusState) {
                return SafeArea(
                  child: DetailContent(
                    tv.tvDetail,
                    tv.tvRecommendations,
                    status.isAddedToWatchlist,
                  ),
                );
              } else if (tv is TvDetailError) {
                return Text(tv.message);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final TvDetail tv;
  final List<Tv> recommendations;
  final bool isAddedWatchlist;

  DetailContent(this.tv, this.recommendations, this.isAddedWatchlist);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: '$BASE_IMAGE_URL${tv.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tv.name,
                              style: kHeading5,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (isAddedWatchlist) {
                                  await context.read<ModifyWatchlistTvBloc>()
                                    ..add(RemoveTv(tv));
                                  await context.read<WatchlistTvStatusBloc>()
                                    ..add(FetchTvStatus(tv.id));
                                } else {
                                  await context.read<ModifyWatchlistTvBloc>()
                                    ..add(AddTv(tv));
                                  await context.read<WatchlistTvStatusBloc>()
                                    ..add(FetchTvStatus(tv.id));
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  isAddedWatchlist
                                      ? const Icon(Icons.check)
                                      : const Icon(Icons.add),
                                  const Text('Watchlist'),
                                ],
                              ),
                            ),
                            Text(
                              showGenres(tv.genres),
                            ),
                            Text(
                              showDuration(tv.episodeRuntime.isNotEmpty
                                      ? tv.episodeRuntime.reduce(
                                          (value, element) => value + element)
                                      : 0) +
                                  ', ${tv.numberOfEpisodes} Episodes',
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: tv.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${tv.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              tv.overview,
                            ),
                            const SizedBox(height: 16),
                            (recommendations.isNotEmpty)
                                ? Text(
                                    'Recommendations',
                                    style: kHeading6,
                                  )
                                : const SizedBox(),
                            SizedBox(
                              height: 150,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final tv = recommendations[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushReplacementNamed(
                                          context,
                                          TV_DETAIL_ROUTE,
                                          arguments: tv.id,
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              '$BASE_IMAGE_URL${tv.posterPath}',
                                          placeholder: (context, url) =>
                                              const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: recommendations.length,
                              ),
                            ),
                            const SizedBox(height: 16),
                            (tv.seasons.isNotEmpty)
                                ? Text(
                                    'Seasons',
                                    style: kHeading6,
                                  )
                                : const SizedBox(),
                            SizedBox(
                              height: 150,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final tvSeriesSeason = tv.seasons[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            '$BASE_IMAGE_URL${tvSeriesSeason.posterPath}',
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: tv.seasons.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            minChildSize: 0.25,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }
}
