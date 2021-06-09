import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modular_notes/app/modules/home/models/note_model.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({Key? key, required this.note}) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(note.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(note.content),
          Text(DateFormat('dd/MM/yyyy - hh:mm').format(note.createdAt)),
        ],
      ),
    );
  }
}
