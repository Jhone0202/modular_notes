import 'dart:convert';

import 'package:modular_notes/app/modules/home/models/bd_base_model.dart';

class Note extends BdBaseModel {
  String title;
  String content;

  Note({
    int? id,
    required this.title,
    required this.content,
    required String createdAt,
  }) : super(id, createdAt);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      createdAt: map['createdAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));
}
