import 'package:beside04_test/domain/model/note.dart';

abstract class NoteRepository {
  Future<void> writeNote(Note note);

  Future<List<Note>> getNotes();

  Future<void> deleteNote(Note note);
}
