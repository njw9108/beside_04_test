import 'package:beside04_test/domain/model/note.dart';
import 'package:beside04_test/domain/use_case/note_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteEditViewModel extends GetxController {
  final NoteUseCase noteUseCase;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  NoteEditViewModel({
    required this.noteUseCase,
  });

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  Future<bool> saveNote(Note note, String title, String content) async {
    if (title.isEmpty || content.isEmpty) {
      return false;
    }
    final newNote = note.copyWith(
      title: title,
      content: content,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );
    await noteUseCase.saveNote(newNote);
    return true;
  }
}
