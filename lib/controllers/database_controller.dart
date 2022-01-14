import 'package:flutter/foundation.dart';
import 'package:inventoryapp/database/db_helper.dart';
import 'package:inventoryapp/modules/item.dart';

class DBController with ChangeNotifier {
  List<Item> list = [];

  Future<int> insertItem(Item item) async {
    return await DBHelper.insert(item);
  }

  updateItem(Item item) async {
    return await DBHelper.update(item);
  }

  getItems(String category) async {
    final List<Map<String, Object?>> data = await DBHelper.query(category);
    list = data.map((e) => Item.fromJson(e)).toList();
    notifyListeners();
  }

  deleteAll() async {
    await DBHelper.deleteAll();
  }

  delete(int id) async {
    await DBHelper.delete(id);
  }
}
