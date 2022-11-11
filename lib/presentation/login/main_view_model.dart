import 'package:beside04_test/domain/repository/social_login_repository.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class MainViewModel {
  final SocialLoginRepository _socialLogin;
  bool isLogin = false;
  User? user;

  MainViewModel(this._socialLogin);

  Future<void> login() async {
    isLogin = await _socialLogin.login();
    if (isLogin) {
      user = await UserApi.instance.me();
    }
  }

  Future<void> logout() async {
    await _socialLogin.logout();
    isLogin = false;
    user = null;
  }
}
