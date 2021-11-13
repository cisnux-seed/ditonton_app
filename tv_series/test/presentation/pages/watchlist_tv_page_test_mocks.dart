import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:tv_series/presentation/bloc/show_watchlist_tv_bloc.dart';

class MockShowWatchlistTvBloc
    extends MockBloc<ShowWatchlistTvEvent, ShowWatchlistTvState>
    implements ShowWatchlistTvBloc {}

class ShowWatchlistTvStateFake extends Fake implements ShowWatchlistTvState {}

class ShowWatchlistTvEventFake extends Fake implements ShowWatchlistTvEvent {}
