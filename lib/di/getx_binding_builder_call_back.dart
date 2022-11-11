import 'package:beside04_test/data/repository/kakao_login_impl.dart';
import 'package:beside04_test/data/repository/token_repository.dart';
import 'package:beside04_test/domain/use_case/get_token_use_case.dart';
import 'package:beside04_test/domain/use_case/kakao_login_use_case.dart';
import 'package:beside04_test/presentation/home/home_view_model.dart';
import 'package:beside04_test/presentation/login/login_view_model.dart';
import 'package:get/get.dart';

final KakaoLoginImpl kakaoLoginImpl = KakaoLoginImpl();
final TokenRepository tokenRepository = TokenRepository();
//use case
final KakaoLoginUseCase kakaoLoginUseCase = KakaoLoginUseCase(
  repository: kakaoLoginImpl,
  tokenRepository: tokenRepository,
);
final GetTokenUseCase getTokenUseCase = GetTokenUseCase(
  tokenRepository: tokenRepository,
);

void getLoginBinding() {
  Get.put(LoginViewModel(kakaoLoginUseCase));
}

void getHomeBinding() {
  Get.put(HomeViewModel(
    getTokenUseCase: getTokenUseCase,
    kakaoLoginUseCase: kakaoLoginUseCase,
  ));
}
