// Mocks generated by Mockito 5.0.16 from annotations
// in core/test/presentation/pages/movies/movie_detail_page_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i11;
import 'dart:ui' as _i12;

import 'package:core/core.dart' as _i9;
import 'package:core/domain/entities/movie.dart' as _i10;
import 'package:core/domain/entities/movie_detail.dart' as _i7;
import 'package:core/domain/usecases/movies/get_movie_detail.dart' as _i2;
import 'package:core/domain/usecases/movies/get_movie_recommendations.dart'
    as _i3;
import 'package:core/domain/usecases/movies/get_watchlist_status.dart' as _i4;
import 'package:core/domain/usecases/movies/remove_watchlist.dart' as _i6;
import 'package:core/domain/usecases/movies/save_watchlist.dart' as _i5;
import 'package:core/presentation/provider/movies/movie_detail_notifier.dart'
    as _i8;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeGetMovieDetail_0 extends _i1.Fake implements _i2.GetMovieDetail {}

class _FakeGetMovieRecommendations_1 extends _i1.Fake
    implements _i3.GetMovieRecommendations {}

class _FakeGetWatchListMoviesStatus_2 extends _i1.Fake
    implements _i4.GetWatchListMoviesStatus {}

class _FakeSaveWatchlistMovies_3 extends _i1.Fake
    implements _i5.SaveWatchlistMovies {}

class _FakeRemoveWatchlistMovies_4 extends _i1.Fake
    implements _i6.RemoveWatchlistMovies {}

class _FakeMovieDetail_5 extends _i1.Fake implements _i7.MovieDetail {}

/// A class which mocks [MovieDetailNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieDetailNotifier extends _i1.Mock
    implements _i8.MovieDetailNotifier {
  MockMovieDetailNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetMovieDetail get getMovieDetail =>
      (super.noSuchMethod(Invocation.getter(#getMovieDetail),
          returnValue: _FakeGetMovieDetail_0()) as _i2.GetMovieDetail);
  @override
  _i3.GetMovieRecommendations get getMovieRecommendations =>
      (super.noSuchMethod(Invocation.getter(#getMovieRecommendations),
              returnValue: _FakeGetMovieRecommendations_1())
          as _i3.GetMovieRecommendations);
  @override
  _i4.GetWatchListMoviesStatus get getWatchListStatus =>
      (super.noSuchMethod(Invocation.getter(#getWatchListStatus),
              returnValue: _FakeGetWatchListMoviesStatus_2())
          as _i4.GetWatchListMoviesStatus);
  @override
  _i5.SaveWatchlistMovies get saveWatchlist => (super.noSuchMethod(
      Invocation.getter(#saveWatchlist),
      returnValue: _FakeSaveWatchlistMovies_3()) as _i5.SaveWatchlistMovies);
  @override
  _i6.RemoveWatchlistMovies get removeWatchlist =>
      (super.noSuchMethod(Invocation.getter(#removeWatchlist),
              returnValue: _FakeRemoveWatchlistMovies_4())
          as _i6.RemoveWatchlistMovies);
  @override
  _i7.MovieDetail get movie => (super.noSuchMethod(Invocation.getter(#movie),
      returnValue: _FakeMovieDetail_5()) as _i7.MovieDetail);
  @override
  _i9.RequestState get movieState =>
      (super.noSuchMethod(Invocation.getter(#movieState),
          returnValue: _i9.RequestState.Empty) as _i9.RequestState);
  @override
  List<_i10.Movie> get movieRecommendations =>
      (super.noSuchMethod(Invocation.getter(#movieRecommendations),
          returnValue: <_i10.Movie>[]) as List<_i10.Movie>);
  @override
  _i9.RequestState get recommendationState =>
      (super.noSuchMethod(Invocation.getter(#recommendationState),
          returnValue: _i9.RequestState.Empty) as _i9.RequestState);
  @override
  String get message =>
      (super.noSuchMethod(Invocation.getter(#message), returnValue: '')
          as String);
  @override
  bool get isAddedToWatchlist =>
      (super.noSuchMethod(Invocation.getter(#isAddedToWatchlist),
          returnValue: false) as bool);
  @override
  String get watchlistMessage =>
      (super.noSuchMethod(Invocation.getter(#watchlistMessage), returnValue: '')
          as String);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  _i11.Future<void> fetchMovieDetail(int? id) => (super.noSuchMethod(
      Invocation.method(#fetchMovieDetail, [id]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> addWatchlist(_i7.MovieDetail? movie) => (super.noSuchMethod(
      Invocation.method(#addWatchlist, [movie]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> removeFromWatchlist(_i7.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#removeFromWatchlist, [movie]),
              returnValue: Future<void>.value(),
              returnValueForMissingStub: Future<void>.value())
          as _i11.Future<void>);
  @override
  _i11.Future<void> loadWatchlistStatus(int? id) => (super.noSuchMethod(
      Invocation.method(#loadWatchlistStatus, [id]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i11.Future<void>);
  @override
  void addListener(_i12.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i12.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}
