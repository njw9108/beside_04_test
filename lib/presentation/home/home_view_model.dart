import 'package:beside04_test/domain/model/note.dart';
import 'package:beside04_test/domain/use_case/get_token_use_case.dart';
import 'package:beside04_test/domain/use_case/kakao_login_use_case.dart';
import 'package:beside04_test/domain/use_case/note_use_case.dart';
import 'package:beside04_test/presentation/home/home_state.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class HomeViewModel extends GetxController {
  final GetTokenUseCase getTokenUseCase;
  final KakaoLoginUseCase kakaoLoginUseCase;
  final NoteUseCase noteUseCase;

  HomeViewModel({
    required this.getTokenUseCase,
    required this.kakaoLoginUseCase,
    required this.noteUseCase,
  }) {
    getTokenData();
    getNotes();
  }

  final Rx<HomeState> _state = HomeState().obs;

  Rx<HomeState> get state => _state;

  Future<void> getNotes() async {
    final notes = await noteUseCase.getNotes();

    _state.value = state.value.copyWith(
      notes: notes,
    );
  }

  Future<void> deleteNotes(Note note) async {
    await noteUseCase.deleteNote(note);
    getNotes();
  }

  Future<void> writeNotes() async {}

  Future<void> getTokenData() async {
    final accessToken = await getTokenUseCase.getAccessToken();
    final refreshToken = await getTokenUseCase.getRefreshToken();

    _state.value = state.value.copyWith(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  Future<bool> logout() async {
    final UserIdResponse? response = await kakaoLoginUseCase.logout();

    return response != null;
  }
}
