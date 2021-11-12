import 'package:core/presentation/bloc/movies/top_rated_movies_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

class MockTopRatedMoviesBloc
    extends MockBloc<TopRatedMoviesEvent, TopRatedMoviesState>
    implements TopRatedMoviesBloc {}

class TopRatedMoviesStateFake extends Fake implements TopRatedMoviesState {}

class TopRatedMoviesEventFake extends Fake implements TopRatedMoviesEvent {}
