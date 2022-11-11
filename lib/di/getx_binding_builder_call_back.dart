import 'package:beside04_test/data/repository/kakao_login_impl.dart';
import 'package:beside04_test/data/repository/token_repository.dart';
import 'package:beside04_test/domain/use_case/kakao_login_use_case.dart';
import 'package:beside04_test/presentation/login/login_view_model.dart';
import 'package:get/get.dart';

void getBinding() {
  final KakaoLoginImpl kakaoLoginImpl = KakaoLoginImpl();
  final TokenRepository tokenRepository = TokenRepository();

  final KakaoLoginUseCase kakaoLoginUseCase = KakaoLoginUseCase(
    repository: kakaoLoginImpl,
    tokenRepository: tokenRepository,
  );

  Get.put(LoginViewModel(kakaoLoginUseCase));
}
