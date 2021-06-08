import 'package:modular_notes/app/modules/home/interfaces/notes_repository_interface.dart';
import 'package:modular_notes/app/modules/home/models/note_model.dart';

class NotesRepositorySqlite extends INotesRepository {
  @override
  Future<bool> addNote() {
    // TODO: implement addNote
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> getAllNotes() {
    // TODO: implement getAllNotes
    throw UnimplementedError();
  }
}
