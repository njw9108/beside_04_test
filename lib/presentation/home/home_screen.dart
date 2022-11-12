import 'package:beside04_test/di/getx_binding_builder_call_back.dart';
import 'package:beside04_test/domain/model/note.dart';
import 'package:beside04_test/presentation/home/conponents/note_widget.dart';
import 'package:beside04_test/presentation/home/home_view_model.dart';
import 'package:beside04_test/presentation/login/login_screen.dart';
import 'package:beside04_test/presentation/note_edit/note_edit_screen.dart';
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () async {
          final res = await Get.to(
            const NoteEditScreen(),
            binding: BindingsBuilder(getNoteEditBinding),
          );
          if (res != null && res == true) {
            controller.getNotes();
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Access Token'),
            Obx(
              () => Text(state.value.accessToken),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Refresh Token'),
            Obx(
              () => Text(state.value.refreshToken),
            ),
            const Divider(
              color: Colors.black54,
            ),
            const Text(
              '글 목록',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Obx(
                () => GridView.builder(
                  shrinkWrap: true,
                  itemCount: state.value.notes.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
                    childAspectRatio: 1, //가로 세로 비율
                    mainAxisSpacing: 10, //수평 Padding
                    crossAxisSpacing: 10, //수직 Padding
                  ),
                  itemBuilder: (context, index) {
                    return Obx(
                      () => NoteWidget(
                        note: state.value.notes[index],
                        noteDelete: controller.deleteNotes,
                        noteTap: _noteTap,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _noteTap(Note note) async {
    final res = await Get.to(
      NoteEditScreen(
        note: note,
      ),
      binding: BindingsBuilder(getNoteEditBinding),
    );
    if (res != null && res == true) {
      controller.getNotes();
    }
  }
}
