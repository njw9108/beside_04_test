import 'package:beside04_test/domain/repository/local_secure_data_repository.dart';
import 'package:beside04_test/domain/repository/social_login_repository.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLoginUseCase {
  final SocialLoginRepository repository;
  final LocalSecureDataRepository tokenRepository;

  KakaoLoginUseCase({
    required this.repository,
    required this.tokenRepository,
  });

  Future<OAuthToken?> login() async {
    final OAuthToken? result = await repository.login();
    if (result != null) {
      await tokenRepository.saveData('accessToken', result.accessToken);
      await tokenRepository.saveData('refreshToken', result.refreshToken);
    }

    return result;
  }

  Future<UserIdResponse?> logout() async {
    return await repository.logout();
  }
}
