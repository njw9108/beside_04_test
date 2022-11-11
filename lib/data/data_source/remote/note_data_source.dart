import 'package:beside04_test/domain/model/note.dart';

class NoteDataSource {
  Future<void> writeNote(Note note) async {
    if (note.id == null) {
      notes.add(note);
    } else {
      int index = notes.indexOf(note);
      notes[index] = note;
    }
  }

  Future<List<Note>> getNotes() async {
    return List.from(notes);
  }

  Future<void> deleteNote(Note note) async {
    int index = notes.indexOf(note);
    notes.removeAt(index);
  }
}

final notes = [
  Note(
      title: 'note1',
      content:
          '안녕하세요.\nnote 1 입니다. 문장이 길어지면 어떻게 될까? 테스트해보자.문장이 길어지면 어떻게 될까? 테스트해보자.문장이 길어지면 어떻게 될까? 테스트해보자.문장이 길어지면 어떻게 될까? 테스트해보자.문장이 길어지면 어떻게 될까? 테스트해보자.',
      writeTime: DateTime.now()),
  Note(
      title: 'note2',
      content: '안녕하세요.\nnote 2 입니다.',
      writeTime: DateTime.now()),
  Note(
      title: 'note3',
      content: '안녕하세요.\nnote 3 입니다.',
      writeTime: DateTime.now()),
  Note(
      title: 'note4',
      content: '안녕하세요.\nnote 4 입니다.',
      writeTime: DateTime.now()),
  Note(
      title: 'note5',
      content: '안녕하세요.\nnote 5 입니다.',
      writeTime: DateTime.now()),
  Note(
      title: 'note6',
      content: '안녕하세요.\nnote 6 입니다.',
      writeTime: DateTime.now()),
];
