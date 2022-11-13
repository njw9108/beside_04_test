import 'package:beside04_test/domain/repository/local_secure_data_repository.dart';
import 'package:beside04_test/domain/repository/social_login_repository.dart';
import 'package:beside04_test/domain/repository/user_info_repository.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLoginUseCase {
  final SocialLoginRepository repository;
  final LocalSecureDataRepository tokenRepository;
  final UserInfoRepository userInfoRepository;

  KakaoLoginUseCase({
    required this.repository,
    required this.tokenRepository,
    required this.userInfoRepository,
  });

  Future<OAuthToken?> login() async {
    final OAuthToken? result = await repository.login();
    if (result != null) {
      print('check access token : ${result.accessToken}');
      print('check refresh token : ${result.refreshToken}');
      await tokenRepository.saveData('accessToken', result.accessToken);
      await tokenRepository.saveData('refreshToken', result.refreshToken);
      User user = await UserApi.instance.me();
      await userInfoRepository.saveUserLoginId(user.id.toString());
    }

    return result;
  }

  Future<UserIdResponse?> logout() async {
    return await repository.logout();
  }
}
