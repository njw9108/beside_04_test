import 'package:beside04_test/data/data_source/local/local_secure_data_source.dart';
import 'package:beside04_test/domain/repository/local_secure_data_repository.dart';

class TokenRepository implements LocalSecureDataRepository {
  final LocalSecureDataSource _dataSource = LocalSecureDataSource();

  @override
  Future<void> saveData(String key, String data) async {
    await _dataSource.saveData(key, data);
  }

  @override
  Future<String> loadData(String key) async {
    return await _dataSource.loadData(key) ?? '';
  }

  @override
  Future<void> deleteData(String key) async {
    await _dataSource.deleteData(key);
  }
}
