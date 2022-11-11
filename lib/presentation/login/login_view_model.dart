import 'package:beside04_test/domain/use_case/kakao_login_use_case.dart';
import 'package:beside04_test/presentation/login/login_state.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class LoginViewModel extends GetxController {
  final KakaoLoginUseCase kakaoLoginUseCase;

  LoginViewModel(this.kakaoLoginUseCase);

  final Rx<LoginState> _state = LoginState().obs;

  Rx<LoginState> get state => _state;

  Future<void> login() async {
    final OAuthToken? token = await kakaoLoginUseCase.login();
    User? user;
    if (token != null) {
      user = await UserApi.instance.me();
    }
    _state.value = state.value.copyWith(
      isLogin: token != null,
      user: user,
    );
  }
}
