import 'package:core/core.dart';
import 'package:core/presentation/bloc/movies/modify_watchlist_movies_bloc.dart';
import 'package:core/presentation/bloc/movies/movie_detail_bloc.dart';
import 'package:core/presentation/bloc/movies/now_playing_movies_bloc.dart';
import 'package:core/presentation/bloc/movies/popular_movies_bloc.dart';
import 'package:core/presentation/bloc/movies/show_watchlist_movies_bloc.dart';
import 'package:core/presentation/bloc/movies/top_rated_movies_bloc.dart';
import 'package:core/presentation/bloc/movies/watchlist_movies_status_bloc.dart';
import 'package:core/presentation/bloc/tv/modify_watchlist_tv_bloc.dart';
import 'package:core/presentation/bloc/tv/on_the_air_tv_bloc.dart';
import 'package:core/presentation/bloc/tv/popular_tv_bloc.dart';
import 'package:core/presentation/bloc/tv/show_watchlist_tv_bloc.dart';
import 'package:core/presentation/bloc/tv/top_rated_tv_bloc.dart';
import 'package:core/presentation/bloc/tv/tv_detail_bloc.dart';
import 'package:core/presentation/bloc/tv/watchlist_tv_status_bloc.dart';
import 'package:core/presentation/pages/home_page.dart';
import 'package:core/presentation/pages/movies/movie_detail_page.dart';
import 'package:core/presentation/pages/movies/popular_movies_page.dart';
import 'package:core/presentation/pages/movies/top_rated_movies_page.dart';
import 'package:core/presentation/pages/tv/popular_tv_page.dart';
import 'package:core/presentation/pages/tv/top_rated_tv_page.dart';
import 'package:core/presentation/pages/tv/tv_detail_page.dart';
import 'package:core/presentation/pages/watchlist_page.dart';
import 'package:core/utils/routes.dart';
import 'package:core/utils/ssl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:about/about.dart';
import 'package:search/presentation/bloc/movies/movies_search_bloc.dart';
import 'package:search/presentation/bloc/tv/tv_search_bloc.dart';
import 'package:search/search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  di.init(await getHttpClient());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.locator<NowPlayingMoviesBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<PopularMoviesBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<TopRatedMoviesBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<ModifyWatchlistMoviesBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<WatchlistMoviesStatusBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<MovieDetailBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<ShowWatchlistMoviesBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<MoviesSearchBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<OnTheAirTvBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<PopularTvBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<TopRatedTvBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<ModifyWatchlistTvBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<WatchlistTvStatusBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<TvDetailBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<ShowWatchlistTvBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<TvSearchBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
          colorScheme: kColorScheme.copyWith(
            secondary: kMikadoYellow,
          ),
        ),
        initialRoute: HOME_ROUTE,
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case HOME_ROUTE:
              return MaterialPageRoute(builder: (_) => HomePage());
            case POPULAR_MOVIES_ROUTE:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case POPULAR_TV_ROUTE:
              return CupertinoPageRoute(builder: (_) => PopularTvPage());
            case TOP_RATED_MOVIES_ROUTE:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case TOP_RATED_TV_ROUTE:
              return CupertinoPageRoute(builder: (_) => TopRatedTvPage());
            case MOVIE_DETAIL_ROUTE:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SEARCH_ROUTE:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            case TV_DETAIL_ROUTE:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvDetailPage(id: id),
                settings: settings,
              );
            case WATCHLIST_ROUTE:
              return MaterialPageRoute(builder: (_) => WatchlistPage());
            case ABOUT_ROUTE:
              return MaterialPageRoute(builder: (_) => AboutPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
