abstract class LocalSecureDataRepository {
  Future<String> loadData(String key);

  Future<void> saveData(String key, String data);

  Future<void> deleteData(String key);
}
