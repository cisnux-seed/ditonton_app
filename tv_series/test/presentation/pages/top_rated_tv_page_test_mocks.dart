import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:tv_series/presentation/bloc/top_rated_tv_bloc.dart';

class MockTopRatedTvBloc extends MockBloc<TopRatedTvEvent, TopRatedTvState>
    implements TopRatedTvBloc {}

class TopRatedTvStateFake extends Fake implements TopRatedTvState {}

class TopRatedTvEventFake extends Fake implements TopRatedTvEvent {}
