import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modular_notes/app/modules/home/interfaces/notes_repository_interface.dart';
import 'package:modular_notes/app/modules/home/models/note_model.dart';

class NotesRepositoryFb extends INotesRepository {
  final FirebaseFirestore firestore;

  NotesRepositoryFb(this.firestore);

  @override
  Future<bool> addNote(Note note) async {
    try {
      await firestore.collection('notes').add(note.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<Note>> getAllNotes() async {
    return await firestore
        .collection('notes')
        .get()
        .then((value) => value.docs.map((e) => Note.fromSnapshot(e)).toList());
  }

  @override
  Future<bool> removeNote(Note note) async {
    try {
      await firestore.collection('notes').doc('${note.id}').delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
