// Mocks generated by Mockito 5.0.16 from annotations
// in tv_series/test/helpers/test_helper.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;
import 'dart:convert' as _i20;
import 'dart:typed_data' as _i21;

import 'package:core/core.dart' as _i8;
import 'package:core/data/datasources/db/database_helper.dart' as _i15;
import 'package:core/utils/network_info.dart' as _i18;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/io_client.dart' as _i4;
import 'package:http/src/base_request.dart' as _i19;
import 'package:http/src/response.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movies/data/models/movie_table.dart' as _i17;
import 'package:sqflite_sqlcipher/sqflite.dart' as _i16;
import 'package:tv_series/data/datasources/tv_local_data_source.dart' as _i11;
import 'package:tv_series/data/datasources/tv_remote_data_source.dart' as _i13;
import 'package:tv_series/data/models/tv_detail_model.dart' as _i3;
import 'package:tv_series/data/models/tv_model.dart' as _i14;
import 'package:tv_series/data/models/tv_table.dart' as _i12;
import 'package:tv_series/domain/entities/tv.dart' as _i9;
import 'package:tv_series/domain/entities/tv_detail.dart' as _i10;
import 'package:tv_series/domain/repositories/tv_repository.dart' as _i6;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeTvDetailResponse_1 extends _i1.Fake implements _i3.TvDetailResponse {
}

class _FakeIOStreamedResponse_2 extends _i1.Fake
    implements _i4.IOStreamedResponse {}

class _FakeResponse_3 extends _i1.Fake implements _i5.Response {}

/// A class which mocks [TvRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRepository extends _i1.Mock implements _i6.TvRepository {
  MockTvRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>> getOnTheAirTv() =>
      (super.noSuchMethod(Invocation.method(#getOnTheAirTv, []),
              returnValue: Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>.value(
                  _FakeEither_0<_i8.Failure, List<_i9.Tv>>()))
          as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>> getPopularTv() =>
      (super.noSuchMethod(Invocation.method(#getPopularTv, []),
              returnValue: Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>.value(
                  _FakeEither_0<_i8.Failure, List<_i9.Tv>>()))
          as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>> getTopRatedTv() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTv, []),
              returnValue: Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>.value(
                  _FakeEither_0<_i8.Failure, List<_i9.Tv>>()))
          as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, _i10.TvDetail>> getTvDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvDetail, [id]),
              returnValue: Future<_i2.Either<_i8.Failure, _i10.TvDetail>>.value(
                  _FakeEither_0<_i8.Failure, _i10.TvDetail>()))
          as _i7.Future<_i2.Either<_i8.Failure, _i10.TvDetail>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>> getTvRecommendations(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvRecommendations, [id]),
              returnValue: Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>.value(
                  _FakeEither_0<_i8.Failure, List<_i9.Tv>>()))
          as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>> searchTv(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTv, [query]),
              returnValue: Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>.value(
                  _FakeEither_0<_i8.Failure, List<_i9.Tv>>()))
          as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> saveWatchlistTv(
          _i10.TvDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlistTv, [movie]),
              returnValue: Future<_i2.Either<_i8.Failure, String>>.value(
                  _FakeEither_0<_i8.Failure, String>()))
          as _i7.Future<_i2.Either<_i8.Failure, String>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> removeWatchlistTv(
          _i10.TvDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistTv, [movie]),
              returnValue: Future<_i2.Either<_i8.Failure, String>>.value(
                  _FakeEither_0<_i8.Failure, String>()))
          as _i7.Future<_i2.Either<_i8.Failure, String>>);
  @override
  _i7.Future<bool> isAddedToWatchlistTv(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlistTv, [id]),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>> getWatchlistTv() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTv, []),
              returnValue: Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>.value(
                  _FakeEither_0<_i8.Failure, List<_i9.Tv>>()))
          as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [TvLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvLocalDataSource extends _i1.Mock implements _i11.TvLocalDataSource {
  MockTvLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<String> insertWatchlistTv(_i12.TvTable? tv) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistTv, [tv]),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<String> removeWatchlistTv(_i12.TvTable? tv) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistTv, [tv]),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i12.TvTable?> getTvById(int? id) => (super.noSuchMethod(
      Invocation.method(#getTvById, [id]),
      returnValue: Future<_i12.TvTable?>.value()) as _i7.Future<_i12.TvTable?>);
  @override
  _i7.Future<List<_i12.TvTable>> getWatchlistTv() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTv, []),
              returnValue: Future<List<_i12.TvTable>>.value(<_i12.TvTable>[]))
          as _i7.Future<List<_i12.TvTable>>);
  @override
  _i7.Future<void> cacheOnTheAirTv(List<_i12.TvTable>? tv) =>
      (super.noSuchMethod(Invocation.method(#cacheOnTheAirTv, [tv]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<List<_i12.TvTable>> getCachedOnTheAirTv() =>
      (super.noSuchMethod(Invocation.method(#getCachedOnTheAirTv, []),
              returnValue: Future<List<_i12.TvTable>>.value(<_i12.TvTable>[]))
          as _i7.Future<List<_i12.TvTable>>);
  @override
  _i7.Future<void> cachePopularTv(List<_i12.TvTable>? tv) =>
      (super.noSuchMethod(Invocation.method(#cachePopularTv, [tv]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<List<_i12.TvTable>> getCachedPopularTv() =>
      (super.noSuchMethod(Invocation.method(#getCachedPopularTv, []),
              returnValue: Future<List<_i12.TvTable>>.value(<_i12.TvTable>[]))
          as _i7.Future<List<_i12.TvTable>>);
  @override
  _i7.Future<void> cacheTopRatedTv(List<_i12.TvTable>? tv) =>
      (super.noSuchMethod(Invocation.method(#cacheTopRatedTv, [tv]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<List<_i12.TvTable>> getCachedTopRatedTv() =>
      (super.noSuchMethod(Invocation.method(#getCachedTopRatedTv, []),
              returnValue: Future<List<_i12.TvTable>>.value(<_i12.TvTable>[]))
          as _i7.Future<List<_i12.TvTable>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [TvRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRemoteDataSource extends _i1.Mock
    implements _i13.TvRemoteDataSource {
  MockTvRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i14.TvModel>> getOnTheAirTv() =>
      (super.noSuchMethod(Invocation.method(#getOnTheAirTv, []),
              returnValue: Future<List<_i14.TvModel>>.value(<_i14.TvModel>[]))
          as _i7.Future<List<_i14.TvModel>>);
  @override
  _i7.Future<List<_i14.TvModel>> getPopularTv() =>
      (super.noSuchMethod(Invocation.method(#getPopularTv, []),
              returnValue: Future<List<_i14.TvModel>>.value(<_i14.TvModel>[]))
          as _i7.Future<List<_i14.TvModel>>);
  @override
  _i7.Future<List<_i14.TvModel>> getTopRatedTv() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTv, []),
              returnValue: Future<List<_i14.TvModel>>.value(<_i14.TvModel>[]))
          as _i7.Future<List<_i14.TvModel>>);
  @override
  _i7.Future<_i3.TvDetailResponse> getTvDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvDetail, [id]),
              returnValue:
                  Future<_i3.TvDetailResponse>.value(_FakeTvDetailResponse_1()))
          as _i7.Future<_i3.TvDetailResponse>);
  @override
  _i7.Future<List<_i14.TvModel>> getTvRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvRecommendations, [id]),
              returnValue: Future<List<_i14.TvModel>>.value(<_i14.TvModel>[]))
          as _i7.Future<List<_i14.TvModel>>);
  @override
  _i7.Future<List<_i14.TvModel>> searchTv(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTv, [query]),
              returnValue: Future<List<_i14.TvModel>>.value(<_i14.TvModel>[]))
          as _i7.Future<List<_i14.TvModel>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i15.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i16.Database?> get database =>
      (super.noSuchMethod(Invocation.getter(#database),
              returnValue: Future<_i16.Database?>.value())
          as _i7.Future<_i16.Database?>);
  @override
  _i7.Future<void> insertCacheTransactionMovies(
          List<_i17.MovieTable>? movies, String? category) =>
      (super.noSuchMethod(
          Invocation.method(#insertCacheTransactionMovies, [movies, category]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<List<Map<String, dynamic>>> getCacheMovies(String? category) =>
      (super.noSuchMethod(Invocation.method(#getCacheMovies, [category]),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i7.Future<List<Map<String, dynamic>>>);
  @override
  _i7.Future<int> clearCacheMovies(String? category) =>
      (super.noSuchMethod(Invocation.method(#clearCacheMovies, [category]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<int> insertWatchlistMovies(_i17.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistMovies, [movie]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<int> removeWatchlistMovies(_i17.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistMovies, [movie]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i7.Future<Map<String, dynamic>?>);
  @override
  _i7.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i7.Future<List<Map<String, dynamic>>>);
  @override
  _i7.Future<void> insertCacheTransactionTv(
          List<_i12.TvTable>? tvSeries, String? category) =>
      (super.noSuchMethod(
          Invocation.method(#insertCacheTransactionTv, [tvSeries, category]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<List<Map<String, dynamic>>> getCacheTv(String? category) =>
      (super.noSuchMethod(Invocation.method(#getCacheTv, [category]),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i7.Future<List<Map<String, dynamic>>>);
  @override
  _i7.Future<int> clearCacheTv(String? category) =>
      (super.noSuchMethod(Invocation.method(#clearCacheTv, [category]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<int> insertWatchlistTv(_i12.TvTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistTv, [movie]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<int> removeWatchlistTv(_i12.TvTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistTv, [movie]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<Map<String, dynamic>?> getTvById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i7.Future<Map<String, dynamic>?>);
  @override
  _i7.Future<List<Map<String, dynamic>>> getWatchlistTv() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTv, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i7.Future<List<Map<String, dynamic>>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i18.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [IOClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockIOClient extends _i1.Mock implements _i4.IOClient {
  MockIOClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i4.IOStreamedResponse> send(_i19.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue: Future<_i4.IOStreamedResponse>.value(
                  _FakeIOStreamedResponse_2()))
          as _i7.Future<_i4.IOStreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
  @override
  _i7.Future<_i5.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i20.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i20.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i20.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i20.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i21.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i21.Uint8List>.value(_i21.Uint8List(0)))
          as _i7.Future<_i21.Uint8List>);
  @override
  String toString() => super.toString();
}
