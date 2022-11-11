import 'package:beside04_test/domain/repository/social_login_repository.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLoginUseCase {
  final SocialLoginRepository repository;

  KakaoLoginUseCase(this.repository);

  Future<OAuthToken?> login() async {
    return await repository.login();
  }

  Future<UserIdResponse?> logout() async {
    return await repository.logout();
  }
}
