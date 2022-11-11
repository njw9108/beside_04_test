import 'package:beside04_test/data/repository/kakao_login_impl.dart';
import 'package:beside04_test/presentation/login/login_screen.dart';
import 'package:beside04_test/presentation/login/login_view_model.dart';
import 'package:beside04_test/res/constant/key.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:get/get.dart';

void main() {
  KakaoSdk.init(nativeAppKey: nativeAppKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final KakaoLoginImpl kakaoLoginImpl = KakaoLoginImpl();

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(LoginViewModel(kakaoLoginImpl));
      }),
      home: const LoginScreen(),
    );
  }
}
