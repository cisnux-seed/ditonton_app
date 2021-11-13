import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/presentation/bloc/popular_movies_bloc.dart';

class MockPopularMoviesBloc
    extends MockBloc<PopularMoviesEvent, PopularMoviesState>
    implements PopularMoviesBloc {}

class PopularMoviesStateFake extends Fake implements PopularMoviesState {}

class PopularMoviesEventFake extends Fake implements PopularMoviesEvent {}
