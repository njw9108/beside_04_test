import 'package:beside04_test/domain/repository/user_info_repository.dart';

class UserInfoRepositoryImpl implements UserInfoRepository {
  @override
  Future<String> loadUserLoginId() async {
    return _userId;
  }

  @override
  Future<void> saveUserLoginId(String id) async {
    _userId = id;
  }
}

String _userId = '';
