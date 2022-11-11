import 'package:beside04_test/presentation/home/home_view_model.dart';
import 'package:beside04_test/presentation/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeViewModel> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = controller.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('홈 화면'),
        actions: [
          IconButton(
            onPressed: () async {
              final res = await controller.logout();
              if (res) {
                Get.offAll(const LoginScreen());
              }
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Access Token'),
            Text(state.value.accessToken),
            const SizedBox(
              height: 20,
            ),
            const Text('Refresh Token'),
            Text(state.value.refreshToken),
          ],
        ),
      ),
    );
  }
}
