import 'dart:convert';
import 'dart:html';

import 'package:flutter_storage_provider/src/storage/storage.dart';

class StorageWeb extends Storage {

  @override
  Future<bool> delete(String key) async {
    try {
      window.localStorage[key] = null;
    } catch (e) {
      print(e);
      return false;
    }

    return true;
  }

  @override
  Future<Map<String, dynamic>> get(String key) async {
    var database = await window.localStorage[key];

    return jsonDecode(database);
  }

  @override
  Future<bool> store(Map<String, dynamic> object, String key) async {
    try {
      window.localStorage[key] = jsonEncode(object);
    } catch (e) {
      print(e);
      return false;
    }

    return true;
  }

}
