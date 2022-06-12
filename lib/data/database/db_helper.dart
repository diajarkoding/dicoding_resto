import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper._private();
  static DatabaseHelper instance = DatabaseHelper._private();

  static Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initializeDb();
      return _database!;
    } else {
      return _database!;
    }
  }

  final String _tableName = 'favorite';

  Future<Database> _initializeDb() async {
    Directory docDir = await getApplicationDocumentsDirectory();

    String path = join(docDir.path, 'favorite.db');

    var db = openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName (
            id TEXT PRIMARY KEY NOT NULL,
            name TEXT NOT NULL,
            description TEXT NOT NULL,
            city TEXT NOT NULL,
            pictureId TEXT NOT NULL,
            rating REAL NOT NULL
           )''',
        );
      },
    );

    return db;
  }

  Future closeDb() async {
    _database = await instance.database;
    _database!.close();
  }
}
