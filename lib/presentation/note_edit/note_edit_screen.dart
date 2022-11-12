import 'package:beside04_test/domain/model/note.dart';
import 'package:beside04_test/presentation/note_edit/note_edit_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteEditScreen extends GetView<NoteEditViewModel> {
  final Note? note;

  const NoteEditScreen({
    Key? key,
    this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (note != null) {
      controller.titleController.text = note!.title;
      controller.contentController.text = note!.content;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('노트'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final res = await controller.saveNote(
              note?.id,
              controller.titleController.text,
              controller.contentController.text);
          if (res == true) {
            Get.back(result: true);
          }
        },
        child: const Icon(Icons.save),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.contentController,
                maxLines: 15,
                style: const TextStyle(fontSize: 25, color: Colors.black),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter some content',
                  hintStyle: TextStyle(color: Colors.black54),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
