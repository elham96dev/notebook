
import 'package:notebook/views/service/note_service.dart';

class Notes {
  int? id;
  final String title;
  final String text;
  final String datetime;

  Notes({
    this.id,
    required this.title,
    required this.text,
    required this.datetime
  });

  factory Notes.fromMap({required Map<String, dynamic> map}) => Notes(
      id: map[idColumn],
      title: map[titleColumn],
      text: map[textColumn],
      datetime: map[datetimeColumn]
  );

  Map<String, dynamic> toMap() => {
    idColumn: id,
    titleColumn: title,
    textColumn: text,
    datetimeColumn: datetime,
  };


}

