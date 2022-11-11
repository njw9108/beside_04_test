import 'package:beside04_test/domain/repository/social_login_repository.dart';

class KakaoLoginUseCase {
  final SocialLoginRepository repository;

  KakaoLoginUseCase(this.repository);

  Future<bool> login() async {
    return await repository.login();
  }

  Future<bool> logout() async {
    return await repository.logout();
  }
}
