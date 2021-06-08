import 'package:mobx/mobx.dart';
import 'package:modular_notes/app/modules/home/interfaces/notes_repository_interface.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final INotesRepository repository;

  HomeStoreBase(this.repository);
}
