import 'package:flutter_storage_provider/src/storage/storage_int.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast_web/sembast_web.dart';

class StorageWebIndexedDB extends StorageInt {

  final String dbPath;

  StorageWebIndexedDB({this.dbPath});

  var sembastStore = intMapStoreFactory.store();
  var dbFactory = databaseFactoryWeb;

  @override
  Future<bool> delete(int key) async {
    try {
      var db = await dbFactory.openDatabase(dbPath);
      await sembastStore.record(key).put(db, null);
    } catch (e) {
      print(e);
      return false;
    }

    return true;
  }

  @override
  Future<Map<String, dynamic>> get(int key) async {
    var db = await dbFactory.openDatabase(dbPath);
    var database = await sembastStore.record(key).get(db);

    if (database == null) return null;

    return database;
  }

  @override
  Future<bool> store(Map<String, dynamic> object, int key) async {
    try {
      var db = await dbFactory.openDatabase(dbPath);
      await sembastStore.record(key).put(db, object);
    } catch (e) {
      print(e);
      return false;
    }

    return true;
  }
}
