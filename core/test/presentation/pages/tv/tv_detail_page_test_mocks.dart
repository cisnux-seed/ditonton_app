import 'package:core/presentation/bloc/tv/modify_watchlist_tv_bloc.dart';
import 'package:core/presentation/bloc/tv/watchlist_tv_status_bloc.dart';
import 'package:core/presentation/bloc/tv/tv_detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

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
