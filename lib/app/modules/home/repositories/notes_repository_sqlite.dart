import 'package:modular_notes/app/modules/home/database/database_helper.dart';
import 'package:modular_notes/app/modules/home/interfaces/notes_repository_interface.dart';
import 'package:modular_notes/app/modules/home/models/note_model.dart';

class NotesRepositorySqlite extends INotesRepository {
  final DatabaseHelper helper;

  NotesRepositorySqlite(this.helper);

  @override
  Future<bool> addNote(Note note) async {
    try {
      final db = await helper.db;
      db!.insert('Notes', note.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<Note>> getAllNotes() async {
    final db = await helper.db;
    final res = await db!.rawQuery('SELECT * FROM Notes');
    return res.map((e) => Note.fromMap(e)).toList();
  }
}
