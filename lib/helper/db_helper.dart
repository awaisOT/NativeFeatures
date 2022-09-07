import 'package:sqflite/sqflite.dart' as sql;

import 'package:path/path.dart';

class DbPlace {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(join(dbPath, 'places.db'),
        onCreate: ((db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
    }), version: 1);
  }

  static Future dbase(String table, Map<String, dynamic> data) async {
    final db = await DbPlace.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbPlace.database();
    return db.query(table);
  }
}
