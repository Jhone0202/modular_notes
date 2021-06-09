import '../models/note_model.dart';

abstract class INotesRepository {
  Future<List<Note>> getAllNotes();
  Future<bool> addNote(Note note);
  Future<bool> removeNote(Note note);
}
