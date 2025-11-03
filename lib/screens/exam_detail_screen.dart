import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String _pad2(int v) => v.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final dt = exam.dateTime;
    final roomsText = exam.rooms.join(", ");

    return Scaffold(
      appBar: AppBar(
        title: Text('Детали за испит ')
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          color: exam.cardColor,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title + icon
                Row(
                  children: [
                    Icon(exam.iconData, size: 36),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        exam.subjectName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                const Divider(),

                /// 📅 Date & time
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      "${_pad2(dt.day)}.${_pad2(dt.month)}.${dt.year}  ${_pad2(dt.hour)}:${_pad2(dt.minute)}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                /// 📍 Rooms
                Row(
                  children: [
                    const Icon(Icons.room, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        roomsText,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                const Divider(),

                /// ⏳ Remaining time (formattedDelta)
                Row(
                  children: [
                    const Icon(Icons.alarm, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      exam.formattedDelta,  // << користи го твојот getter
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: exam.isPast ? Colors.red : Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
