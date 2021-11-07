import 'package:core/data/models/movie_table.dart';
import 'package:core/data/models/tv_table.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';
import 'package:core/utils/encrypt.dart';
import 'dart:async';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblMovieWatchlist = 'movie_watchlist';
  static const String _tblTvWatchlist = 'tv_watchlist';
  static const String _tblMovieCache = 'movie_cache';
  static const String _tblTvCache = 'tv_cache';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/ditonton.db';

    var db = await openDatabase(
      databasePath,
      version: 1,
      onCreate: _onCreate,
      password: encrypt('@Cisnuxpredator12'),
    );
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblMovieWatchlist (
        id INTEGER PRIMARY KEY,
        title TEXT,
        overview TEXT,
        poster_path TEXT
      );
    ''');
    await db.execute('''
      CREATE TABLE  $_tblTvWatchlist (
        id INTEGER PRIMARY KEY,
        name TEXT,
        overview TEXT,
        poster_path TEXT
      );
    ''');
    await db.execute('''
      CREATE TABLE  $_tblMovieCache (
        id INTEGER PRIMARY KEY,
        title TEXT,
        overview TEXT,
        poster_path TEXT,
        category TEXT
      );
    ''');
    await db.execute('''
      CREATE TABLE  $_tblTvCache (
        id INTEGER PRIMARY KEY,
        name TEXT,
        overview TEXT,
        poster_path TEXT,
        category TEXT
      );
    ''');
  }

  Future<void> insertCacheTransactionMovies(
    List<MovieTable> movies,
    String category,
  ) async {
    final db = await database;
    db!.transaction((txn) async {
      for (final movie in movies) {
        final movieJson = movie.toJson();
        movieJson['category'] = category;
        txn.insert(
          _tblMovieCache,
          movieJson,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }

  Future<List<Map<String, dynamic>>> getCacheMovies(String category) async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(
      _tblMovieCache,
      where: 'category = ?',
      whereArgs: [category],
    );

    return results;
  }

  Future<int> clearCacheMovies(String category) async {
    final db = await database;
    return await db!.delete(
      _tblMovieCache,
      where: 'category = ?',
      whereArgs: [category],
    );
  }

  Future<int> insertWatchlistMovies(MovieTable movie) async {
    final db = await database;
    return await db!.insert(_tblMovieWatchlist, movie.toJson());
  }

  Future<int> removeWatchlistMovies(MovieTable movie) async {
    final db = await database;
    return await db!.delete(
      _tblMovieWatchlist,
      where: 'id = ?',
      whereArgs: [movie.id],
    );
  }

  Future<Map<String, dynamic>?> getMovieById(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblMovieWatchlist,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getWatchlistMovies() async {
    final db = await database;
    final List<Map<String, dynamic>> results =
        await db!.query(_tblMovieWatchlist);
    return results;
  }

  Future<void> insertCacheTransactionTv(
      List<TvTable> tvSeries, String category) async {
    final db = await database;
    db!.transaction((txn) async {
      for (final tv in tvSeries) {
        final tvJson = tv.toJson();
        tvJson['category'] = category;
        txn.insert(
          _tblTvCache,
          tvJson,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }

  Future<List<Map<String, dynamic>>> getCacheTv(String category) async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(
      _tblTvCache,
      where: 'category = ?',
      whereArgs: [category],
    );

    return results;
  }

  Future<int> clearCacheTv(String category) async {
    final db = await database;
    return await db!.delete(
      _tblTvCache,
      where: 'category = ?',
      whereArgs: [category],
    );
  }

  Future<int> insertWatchlistTv(TvTable movie) async {
    final db = await database;
    return await db!.insert(_tblTvWatchlist, movie.toJson());
  }

  Future<int> removeWatchlistTv(TvTable movie) async {
    final db = await database;
    return await db!.delete(
      _tblTvWatchlist,
      where: 'id = ?',
      whereArgs: [movie.id],
    );
  }

  Future<Map<String, dynamic>?> getTvById(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblTvWatchlist,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getWatchlistTv() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblTvWatchlist);
    return results;
  }
}
