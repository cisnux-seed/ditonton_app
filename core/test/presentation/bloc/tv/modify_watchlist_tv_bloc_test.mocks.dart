// Mocks generated by Mockito 5.0.16 from annotations
// in core/test/presentation/bloc/tv/modify_watchlist_tv_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:core/core.dart' as _i6;
import 'package:core/domain/entities/tv_detail.dart' as _i7;
import 'package:core/domain/repositories/tv_repository.dart' as _i2;
import 'package:core/domain/usecases/tv/remove_watchlist_tv.dart' as _i8;
import 'package:core/domain/usecases/tv/save_watchlist_tv.dart' as _i4;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeTvRepository_0 extends _i1.Fake implements _i2.TvRepository {}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [SaveWatchlistTv].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveWatchlistTv extends _i1.Mock implements _i4.SaveWatchlistTv {
  MockSaveWatchlistTv() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTvRepository_0()) as _i2.TvRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, String>> execute(_i7.TvDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#execute, [tv]),
              returnValue: Future<_i3.Either<_i6.Failure, String>>.value(
                  _FakeEither_1<_i6.Failure, String>()))
          as _i5.Future<_i3.Either<_i6.Failure, String>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [RemoveWatchlistTv].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveWatchlistTv extends _i1.Mock implements _i8.RemoveWatchlistTv {
  MockRemoveWatchlistTv() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTvRepository_0()) as _i2.TvRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, String>> execute(_i7.TvDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#execute, [tv]),
              returnValue: Future<_i3.Either<_i6.Failure, String>>.value(
                  _FakeEither_1<_i6.Failure, String>()))
          as _i5.Future<_i3.Either<_i6.Failure, String>>);
  @override
  String toString() => super.toString();
}
