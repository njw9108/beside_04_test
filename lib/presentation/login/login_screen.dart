import 'package:beside04_test/presentation/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginViewModel> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = controller.state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인 화면'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('${state.value.isLogin}')),
            InkWell(
              onTap: () async {
                await controller.login();
              },
              child: SizedBox(
                width: 200,
                child: Image.asset('lib/res/img/kakao_login_large_narrow.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
