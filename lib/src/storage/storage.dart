abstract class Storage {

  Future<Map<String, dynamic>> get(String key);

  Future<bool> store(Map<String, dynamic> object, String key);

  Future<bool> delete(String key);
}
