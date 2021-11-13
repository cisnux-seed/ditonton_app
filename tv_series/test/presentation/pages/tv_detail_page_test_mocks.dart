import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:tv_series/presentation/bloc/modify_watchlist_tv_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_detail_bloc.dart';
import 'package:tv_series/presentation/bloc/watchlist_tv_status_bloc.dart';

class MockTvDetailBloc extends MockBloc<TvDetailEvent, TvDetailState>
    implements TvDetailBloc {}

class TvDetailStateFake extends Fake implements TvDetailState {}

class TvDetailEventFake extends Fake implements TvDetailEvent {}

class MockModifyWatchlistTvBloc
    extends MockBloc<ModifyWatchlistTvEvent, ModifyWatchlistTvState>
    implements ModifyWatchlistTvBloc {}

class ModifyWatchlistTvStateFake extends Fake
    implements ModifyWatchlistTvState {}

class ModifyWatchlistTvEventFake extends Fake
    implements ModifyWatchlistTvEvent {}

class MockWatchlistTvStatusBloc
    extends MockBloc<WatchlistTvStatusEvent, WatchlistTvStatusState>
    implements WatchlistTvStatusBloc {}

class WatchlistTvStatusStateFake extends Fake
    implements WatchlistTvStatusState {}

class WatchlistTvStatusEventFake extends Fake
    implements WatchlistTvStatusEvent {}
