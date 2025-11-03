import 'package:flutter/material.dart';

class Exam {
  final String subjectName; // име на предмет
  final DateTime dateTime; // датум и време
  final List<String> rooms; // простории
  final IconData iconData;


  const Exam({
    required this.subjectName,
    required this.dateTime,
    required this.rooms,
    this.iconData = Icons.bookmark,

  });

  bool get isPast => dateTime.isBefore(DateTime.now());

  Color get cardColor => isPast ? Colors.grey.shade200 : Colors.green.shade50;

  IconData get icon => isPast ? Icons.history : Icons.event_available;


  Duration get timeToExam => dateTime.difference(DateTime.now());

  String get formattedDelta {
    final d = timeToExam;
    final totalHours = d.inHours.abs();
    final days = totalHours ~/ 24;
    final hours = totalHours % 24;
    final txt = "$days дена, $hours часа";
    return isPast ? "пред $txt" : "за $txt";
  }
}

