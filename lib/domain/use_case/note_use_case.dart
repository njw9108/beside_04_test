import 'package:beside04_test/domain/model/note.dart';
import 'package:beside04_test/domain/repository/note_repository.dart';

class NoteUseCase {
  NoteRepository noteRepository;

  NoteUseCase({
    required this.noteRepository,
  });

  Future<void> saveNote(Note note) async {
    await noteRepository.writeNote(note);
  }

  Future<List<Note>> getNotes() async {
    return await noteRepository.getNotes();
  }

  Future<void> deleteNote(Note note) async {
    await noteRepository.deleteNote(note);
  }
}
