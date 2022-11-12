import 'package:beside04_test/domain/model/note.dart';

class NoteDataSource {
  Future<void> writeNote(Note note) async {
    if (note.id == null) {
      note = note.copyWith(
        id: DateTime.now().millisecondsSinceEpoch,
      );
      notes.add(note);
    } else {
      int index = -1;
      for (int i = 0; i < notes.length; i++) {
        if (note.id == notes[i].id) {
          index = i;
          break;
        }
      }
      notes[index] = note;
    }
  }

  Future<List<Note>> getNotes() async {
    return List.from(notes);
  }

  Future<void> deleteNote(Note note) async {
    int index = -1;
    for (int i = 0; i < notes.length; i++) {
      if (note.id == notes[i].id) {
        index = i;
        break;
      }
    }
    notes.removeAt(index);
  }
}

final notes = [
  Note(
    id: 1,
    title: 'note1',
    content:
        '안녕하세요.\nnote 1 입니다. 문장이 길어지면 어떻게 될까? 테스트해보자.문장이 길어지면 어떻게 될까? 테스트해보자.문장이 길어지면 어떻게 될까? 테스트해보자.문장이 길어지면 어떻게 될까? 테스트해보자.문장이 길어지면 어떻게 될까? 테스트해보자.',
    timestamp: DateTime.now().millisecondsSinceEpoch,
  ),
  Note(
    id: 2,
    title: 'note2',
    content: '안녕하세요.\nnote 2 입니다.',
    timestamp: DateTime.now().millisecondsSinceEpoch,
  ),
  Note(
    id: 3,
    title: 'note3',
    content: '안녕하세요.\nnote 3 입니다.',
    timestamp: DateTime.now().millisecondsSinceEpoch,
  ),
];
