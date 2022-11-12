import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

part 'login_state.freezed.dart';

part 'login_state.g.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    User? user,
    @Default(false) bool isLogin,
  }) = _LoginState;

  factory LoginState.fromJson(Map<String, dynamic> json) =>
      _$LoginStateFromJson(json);
}
