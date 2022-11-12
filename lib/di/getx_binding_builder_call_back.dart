import 'package:beside04_test/data/repository/kakao_login_impl.dart';
import 'package:beside04_test/data/repository/note_repository_impl.dart';
import 'package:beside04_test/data/repository/token_repository.dart';
import 'package:beside04_test/domain/repository/note_repository.dart';
import 'package:beside04_test/domain/use_case/get_token_use_case.dart';
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

//use case
final KakaoLoginUseCase kakaoLoginUseCase = KakaoLoginUseCase(
  repository: kakaoLoginImpl,
  tokenRepository: tokenRepository,
);
final GetTokenUseCase getTokenUseCase = GetTokenUseCase(
  tokenRepository: tokenRepository,
);
final NoteUseCase noteUseCase = NoteUseCase(
  noteRepository: noteRepository,
);

void getLoginBinding() {
  Get.put(LoginViewModel(kakaoLoginUseCase));
}

void getHomeBinding() {
  Get.put(HomeViewModel(
    getTokenUseCase: getTokenUseCase,
    kakaoLoginUseCase: kakaoLoginUseCase,
    noteUseCase: noteUseCase,
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
