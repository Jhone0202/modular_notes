import 'dart:convert';

class Note {
  String title;
  String content;
  DateTime dateTime;

  Note({
    this.title = '',
    required this.content,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'],
      content: map['content'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));
}
