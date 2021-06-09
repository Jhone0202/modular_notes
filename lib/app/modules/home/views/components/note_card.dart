import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:modular_notes/app/modules/home/controllers/home_store.dart';
import 'package:modular_notes/app/modules/home/models/note_model.dart';

class NoteCard extends StatefulWidget {
  const NoteCard({
    Key? key,
    required this.note,
    required this.controller,
  }) : super(key: key);

  final Note note;
  final HomeStore controller;

  @override
  _NoteCardState createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  _remove(HomeStore controller, Note note) async {
    final removed = await controller.remove(note);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: removed ? Colors.green : Colors.red,
        content: Text(
          removed
              ? 'Nota removida com sucesso!'
              : 'Ocorreu um erro ao remover a nota',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(16),
      title: Text(widget.note.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.note.content),
          Text(
            DateFormat('dd/MM/yyyy - hh:mm:ss').format(widget.note.createdAt),
          ),
        ],
      ),
      trailing: IconButton(
        icon: Icon(Icons.remove_circle),
        onPressed: () => _remove(widget.controller, widget.note),
      ),
    );
  }
}
