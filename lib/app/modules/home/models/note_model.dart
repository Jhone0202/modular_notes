import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modular_notes/app/modules/home/models/bd_base_model.dart';

class Note extends BdBaseModel {
  String title;
  String content;

  Note({
    String? id,
    required this.title,
    required this.content,
    DateTime? createdAt,
  }) : super(id, createdAt = DateTime.now().toUtc());

  Map<String, dynamic> toMap() {
    return {
      //'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt.toString(),
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      createdAt: DateTime.tryParse(map['createdAt']),
    );
  }

  factory Note.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snap) {
    final map = snap.data();
    return Note(
      id: snap.id,
      title: map['title'],
      content: map['content'],
      createdAt: DateTime.tryParse(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));
}
