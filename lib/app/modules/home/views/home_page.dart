import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_notes/app/modules/home/controllers/home_store.dart';
import 'package:modular_notes/app/modules/home/models/note_model.dart';
import 'components/note_form_dialog.dart';
import 'components/note_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Observer(
        builder: (context) {
          final List<Note> notes = controller.notes;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return NoteCard(note: note, controller: controller);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => NoteFormDialog(controller: controller),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
