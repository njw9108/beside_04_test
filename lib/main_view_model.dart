import 'package:beside04_test/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class MainViewModel {
  final SocialLogin _socialLogin;
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
