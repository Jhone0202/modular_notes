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

  Future _addNote(HomeStore controller) async {
    if (store.validateAndSave(formKey)) {
      final added = await controller.add(Note(title: title, content: content));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: added ? Colors.green : Colors.red,
          content: Text(
            added
                ? 'Nota adicionada com sucesso!'
                : 'Ocorreu um erro ao adicionar a nota',
          ),
        ),
      );
      Modular.to.pop();
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
