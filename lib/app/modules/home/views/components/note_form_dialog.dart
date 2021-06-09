import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_notes/app/modules/home/controllers/home_store.dart';
import 'package:modular_notes/app/modules/home/models/note_model.dart';
import 'package:modular_notes/app/modules/home/utils/utils_store.dart';

class NoteFormDialog extends StatefulWidget {
  const NoteFormDialog({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeStore controller;

  @override
  _NoteFormDialogState createState() => _NoteFormDialogState();
}

class _NoteFormDialogState extends ModularState<NoteFormDialog, UtilsStore> {
  final formKey = GlobalKey<FormState>();
  String title = '';
  String content = '';

  _addNote(HomeStore controller) {
    try {
      if (store.validateAndSave(formKey)) {
        controller.add(
          Note(title: title, content: content),
        );
        Modular.to.pop();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Adicionar Anotação'),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Título'),
              validator: (text) => store.validateRequiredField(text),
              onSaved: (text) => title = text ?? '',
              maxLines: 1,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Conteúdo'),
              validator: (text) => store.validateRequiredField(text),
              onSaved: (text) => content = text ?? '',
              maxLength: 124,
              maxLines: 4,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Modular.to.pop(),
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () => _addNote(widget.controller),
          child: Text('Salvar'),
        )
      ],
    );
  }
}
