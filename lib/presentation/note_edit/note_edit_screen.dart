import 'package:beside04_test/di/getx_binding_builder_call_back.dart';
import 'package:beside04_test/domain/model/note.dart';
import 'package:beside04_test/presentation/home/home_screen.dart';
import 'package:beside04_test/presentation/note_edit/note_edit_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteEditScreen extends GetView<NoteEditViewModel> {
  final Note note;

  const NoteEditScreen({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.titleController.text = note.title;
    controller.contentController.text = note.content;

    return Scaffold(
      appBar: AppBar(
        title: const Text('노트'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final res = await controller.saveNote(
              note,
              controller.titleController.text,
              controller.contentController.text);
          if (res == true) {
            Get.offAll(
              const HomeScreen(),
              binding: BindingsBuilder(getHomeBinding),
            );
          }
        },
        child: const Icon(Icons.save),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 100,
                child: Row(
                  children: [
                    Image.asset(
                      note.emoticonUrl,
                      width: 60,
                      height: 60,
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(8),
                        shrinkWrap: true,
                        itemCount: note.emotion.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                          childAspectRatio: 2.5 / 1, //가로 세로 비율
                          mainAxisSpacing: 10, //수평 Padding
                          crossAxisSpacing: 10, //수직 Padding
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Text(note.emotion[index]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              TextField(
                controller: controller.titleController,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter title...',
                  hintStyle: TextStyle(color: Colors.black54),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller.contentController,
                maxLines: 15,
                style: const TextStyle(fontSize: 25, color: Colors.black),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter some content',
                  hintStyle: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
