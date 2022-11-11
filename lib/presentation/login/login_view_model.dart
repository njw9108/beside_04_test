import 'package:beside04_test/domain/repository/social_login_repository.dart';
import 'package:beside04_test/presentation/login/login_state.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class LoginViewModel extends GetxController {
  final SocialLoginRepository _socialLogin;

  LoginViewModel(this._socialLogin);

  final Rx<LoginState> _state = LoginState().obs;

  Rx<LoginState> get state => _state;

  Future<void> login() async {
    final OAuthToken? token = await _socialLogin.login();
    User? user;
    if (token != null) {
      user = await UserApi.instance.me();
    }
    _state.value = state.value.copyWith(
      isLogin: token != null,
      user: user,
    );
  }

  Future<void> logout() async {
    final UserIdResponse? response = await _socialLogin.logout();
    _state.value = state.value.copyWith(
      isLogin: false,
      user: null,
    );
  }
}
