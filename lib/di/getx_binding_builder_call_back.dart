import 'package:beside04_test/data/repository/kakao_login_impl.dart';
import 'package:beside04_test/data/repository/note_repository_impl.dart';
import 'package:beside04_test/data/repository/token_repository.dart';
import 'package:beside04_test/data/repository/user_info_repository_impl.dart';
import 'package:beside04_test/domain/repository/note_repository.dart';
import 'package:beside04_test/domain/use_case/get_token_use_case.dart';
import 'package:beside04_test/domain/use_case/get_user_info_use_case.dart';
import 'package:beside04_test/domain/use_case/kakao_login_use_case.dart';
import 'package:beside04_test/domain/use_case/note_use_case.dart';
import 'package:beside04_test/presentation/emotion/emotion_view_model.dart';
import 'package:beside04_test/presentation/home/home_view_model.dart';
import 'package:beside04_test/presentation/login/login_view_model.dart';
import 'package:beside04_test/presentation/note_edit/note_edit_view_model.dart';
import 'package:get/get.dart';

final KakaoLoginImpl kakaoLoginImpl = KakaoLoginImpl();
final TokenRepository tokenRepository = TokenRepository();
final NoteRepository noteRepository = NoteRepositoryImpl();
final UserInfoRepositoryImpl userInfoRepositoryImpl = UserInfoRepositoryImpl();

//use case
final KakaoLoginUseCase kakaoLoginUseCase = KakaoLoginUseCase(
  repository: kakaoLoginImpl,
  tokenRepository: tokenRepository,
  userInfoRepository: userInfoRepositoryImpl,
);
final GetTokenUseCase getTokenUseCase = GetTokenUseCase(
  tokenRepository: tokenRepository,
);
final NoteUseCase noteUseCase = NoteUseCase(
  noteRepository: noteRepository,
);
final GetUserInfoUseCase getUserInfoUseCase = GetUserInfoUseCase(
  userInfoRepository: userInfoRepositoryImpl,
);

void getLoginBinding() {
  Get.put(LoginViewModel(kakaoLoginUseCase));
}

void getHomeBinding() {
  Get.put(HomeViewModel(
    getTokenUseCase: getTokenUseCase,
    kakaoLoginUseCase: kakaoLoginUseCase,
    noteUseCase: noteUseCase,
    getUserInfoUseCase: getUserInfoUseCase,
  ));
}

void getNoteEditBinding() {
  Get.put(NoteEditViewModel(
    noteUseCase: noteUseCase,
  ));
}

void getEmotionBinding() {
  Get.put(EmotionViewModel());
}
