import 'package:flutter/material.dart';
import '../data/exams.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  final String indexNumber;
  const ExamListScreen({super.key, required this.indexNumber});

  @override
  Widget build(BuildContext context) {
    // копија + хронолошко сортирање
    final List<Exam> sorted = [...exams]..sort((a, b) => a.dateTime.compareTo(b.dateTime));

    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));


    return Scaffold(
      appBar: AppBar(
        title: Text('Распоред за испити - $indexNumber'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: sorted.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, i) {
                final e = sorted[i];
                return ExamCard(
                  exam: e,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ExamDetailScreen(exam: e)),
                    );
                  },
                );
              },
            ),
          ),
          // долу: вкупен број на испити
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              border: Border(top: BorderSide(color: Colors.black12)),
            ),
            child: Text(
              'Вкупно испити: ${sorted.length}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
