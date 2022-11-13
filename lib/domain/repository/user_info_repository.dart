abstract class UserInfoRepository {
  Future<void> saveUserLoginId(String id);

  Future<String> loadUserLoginId();
}
