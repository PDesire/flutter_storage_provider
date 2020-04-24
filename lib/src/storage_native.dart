import 'dart:convert';

import 'package:flutter_storage_provider/src/storage/storage.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class StorageNative extends Storage {

  final String dbPath;

  StorageNative({this.dbPath});

  DatabaseFactory dbFactory = databaseFactoryIo;
  var sembastStore = StoreRef.main();

  @override
  Future<bool> delete(String key) async {
    try {
      var db = await dbFactory.openDatabase(dbPath);
      await sembastStore.record(key).delete(db);
    } catch (e) {
      print(e);
      return false;
    }

    return true;
  }

  @override
  Future<Map<String, dynamic>> get(String key) async {
    var db = await dbFactory.openDatabase(dbPath);
    var database = await sembastStore.record(key).get(db);

    if (database == null) return null;

    return jsonDecode(database);
  }

  @override
  Future<bool> store(Map<String, dynamic> object, String key) async {
    try {
      var db = await dbFactory.openDatabase(dbPath);
      await sembastStore.record(key).put(db, jsonEncode(object));
    } catch (e) {
      print(e);
      return false;
    }

    return true;
  }
}
