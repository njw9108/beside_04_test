import 'package:beside04_test/data/data_source/remote/note_data_source.dart';
import 'package:beside04_test/domain/model/note.dart';
import 'package:beside04_test/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDataSource _dataSource = NoteDataSource();

  @override
  Future<void> writeNote(Note note) async {
    await _dataSource.writeNote(note);
  }

  @override
  Future<List<Note>> getNotes() async {
    return await _dataSource.getNotes();
  }

  @override
  Future<void> deleteNote(Note note) async {
    await _dataSource.deleteNote(note);
  }
}
