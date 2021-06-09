import 'package:mobx/mobx.dart';

import 'package:modular_notes/app/modules/home/interfaces/notes_repository_interface.dart';
import 'package:modular_notes/app/modules/home/models/note_model.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final INotesRepository repository;

  HomeStoreBase(this.repository) {
    getList();
  }

  @observable
  ObservableList<Note> notes = ObservableList<Note>();

  @action
  getList() async {
    final res = await repository.getAllNotes();
    notes.addAll(res);
  }

  @action
  Future<bool> add(Note note) async {
    final added = await repository.addNote(note);
    if (!added) return false;
    notes.add(note);
    return true;
  }

  @action
  Future<bool> remove(Note note) async {
    final removed = await repository.removeNote(note);
    if (!removed) return false;
    notes.remove(note);
    return true;
  }
}
