import 'package:beside04_test/domain/use_case/get_token_use_case.dart';
import 'package:beside04_test/domain/use_case/kakao_login_use_case.dart';
import 'package:beside04_test/presentation/home/home_state.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class HomeViewModel extends GetxController {
  final GetTokenUseCase getTokenUseCase;
  final KakaoLoginUseCase kakaoLoginUseCase;

  HomeViewModel({
    required this.getTokenUseCase,
    required this.kakaoLoginUseCase,
  }) {
    getTokenData();
  }

  final Rx<HomeState> _state = HomeState().obs;

  Rx<HomeState> get state => _state;

  void getTokenData() async {
    final accessToken = await getAccessToken();
    final refreshToken = await getRefreshToken();

    _state.value = state.value.copyWith(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  Future<String> getAccessToken() async {
    return await getTokenUseCase.getAccessToken();
  }

  Future<String> getRefreshToken() async {
    return await getTokenUseCase.getRefreshToken();
  }

  Future<bool> logout() async {
    final UserIdResponse? response = await kakaoLoginUseCase.logout();

    return response != null;
  }
}
