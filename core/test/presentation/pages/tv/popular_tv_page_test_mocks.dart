import 'package:core/presentation/bloc/tv/popular_tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

class MockPopularTvBloc extends MockBloc<PopularTvEvent, PopularTvState>
    implements PopularTvBloc {}

class PopularTvStateFake extends Fake implements PopularTvState {}

class PopularTvEventFake extends Fake implements PopularTvEvent {}
