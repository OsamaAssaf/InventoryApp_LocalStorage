import 'package:flutter/cupertino.dart';

import 'package:sqflite/sqflite.dart';

import 'package:inventory_app/models/item.dart';

class DBHelper {
  static Database? _db;

  static const int _version = 2;
  static const String _tableName = 'items';

  static initDB() async {
    if (_db != null) {
      return;
    }
    try {
      String path = '${await getDatabasesPath()}inventory.db';
      _db = await openDatabase(
        path,
        version: _version,
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE $_tableName '
              '('
              'id INTEGER PRIMARY KEY AUTOINCREMENT, '
              'name TEXT, '
              'description TEXT, '
              'category STRING, '
              'quantity INTEGER, '
              'price REAL, '
              'imageUrl STRING'
              ')');
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<int> insert(Item item) async {
    try {
      return await _db!.insert(_tableName, item.toJson());
    } catch (e) {
      return -1;
    }
  }

  static update(Item item) async {
    try {
      await _db!.update(_tableName, item.toJson(), where: 'id = ?', whereArgs: [item.id]);
    } catch (e) {
      return -1;
    }
  }

  static Future<List<Map<String, Object?>>> query(String category) async {
    try {
      if (category == 'All') {
        return await _db!.query(_tableName);
      } else {
        return await _db!.query(_tableName, where: 'category = ?', whereArgs: [category]);
      }
    } catch (e) {
      rethrow;
    }
  }

  static deleteAll() async {
    try {
      return await _db!.delete(_tableName);
    } catch (e) {
      rethrow;
    }
  }

  static delete(int id) async {
    try {
      return await _db!.delete(_tableName, where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      rethrow;
    }
  }
}
