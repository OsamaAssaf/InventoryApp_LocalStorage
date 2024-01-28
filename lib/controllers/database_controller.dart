import 'package:flutter/foundation.dart';

import 'package:inventory_app/database/db_helper.dart';
import 'package:inventory_app/models/item.dart';

class DBController with ChangeNotifier {
  List<Item> list = [];

  Future<int> insertItem(Item item) async {
    return await DBHelper.insert(item);
  }

  Future<void> updateItem(Item item) async {
    await DBHelper.update(item);
  }

  Future<void> getItems(String category) async {
    final List<Map<String, Object?>> data = await DBHelper.query(category);
    list = data.map((e) => Item.fromJson(e)).toList();
    notifyListeners();
  }

  Future<void> deleteAll() async {
    await DBHelper.deleteAll();
  }

  Future<void> delete(int id) async {
    await DBHelper.delete(id);
  }
}
