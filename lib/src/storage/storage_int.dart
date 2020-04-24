abstract class StorageInt {

  Future<Map<String, dynamic>> get(int key);

  Future<bool> store(Map<String, dynamic> object, int key);

  Future<bool> delete(int key);
}
