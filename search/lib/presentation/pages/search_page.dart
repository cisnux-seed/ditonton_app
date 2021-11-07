import 'package:core/core.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/presentation/widgets/movie_card_list.dart';
import 'package:core/presentation/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:search/presentation/bloc/movies/movies_search_bloc.dart';
import 'package:search/presentation/bloc/tv/tv_search_bloc.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              key: Key('search-textfield'),
              onChanged: (query) {
                context
                    .read<MoviesSearchBloc>()
                    .add(MoviesOnQueryChanged(query));
                context.read<TvSearchBloc>().add(TvOnQueryChanged(query));
              },
              decoration: const InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            BlocBuilder<MoviesSearchBloc, MoviesSearchState>(
              builder: (_, movie) => BlocBuilder<TvSearchBloc, TvSearchState>(
                builder: (_, tv) {
                  if (movie is MoviesSearchLoading && tv is TvSearchLoading) {
                    return Expanded(
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (tv is TvSearchHasData &&
                      movie is MoviesSearchHasData) {
                    final List<dynamic> result = [
                      ...movie.result,
                      ...tv.result
                    ];
                    return Expanded(
                        child: (result.isNotEmpty)
                            ? ListView.builder(
                                key: Key('search-listview'),
                                itemBuilder: (_, index) =>
                                    (result[index] is Movie)
                                        ? MovieCard(result[index])
                                        : TvCard(result[index]),
                                itemCount: result.length,
                              )
                            : Center(
                                child: Text(
                                    'Cannot Found Movies and Tv Series :('),
                              ));
                  } else {
                    return SizedBox(key: Key('search-error'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
