import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_notes/app/modules/home/database/database_helper.dart';
import 'package:modular_notes/app/modules/home/interfaces/notes_repository_interface.dart';
import 'package:modular_notes/app/modules/home/repositories/notes_repository_sqlite.dart';
import 'package:modular_notes/app/modules/home/utils/utils_store.dart';

import 'controllers/home_store.dart';
import 'views/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HomeStore(i.get())),
    Bind<INotesRepository>((i) => NotesRepositorySqlite(i.get())),
    Bind<DatabaseHelper>((i) => DatabaseHelper()),
    Bind<UtilsStore>((i) => UtilsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
