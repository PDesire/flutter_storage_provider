import 'dart:convert';

import 'package:flutter_storage_provider/src/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageSharedPreferences extends Storage {

  @override
  Future<bool> delete(String key) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, null);
    } catch (e) {
      print(e);
      return false;
    }

    return true;
  }

  @override
  Future<Map<String, dynamic>> get(String key) async {
    var prefs = await SharedPreferences.getInstance();
    var database = await prefs.get(key);

    return jsonDecode(database);
  }

  @override
  Future<bool> store(Map<String, dynamic> object, String key) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, jsonEncode(object));
    } catch (e) {
      print(e);
      return false;
    }

    return true;
  }
}
