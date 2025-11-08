import 'package:flutter/material.dart';
import 'package:mis_lab1/widgets/exam_card.dart';

import '../models/exam_model.dart';

class ExamList extends StatelessWidget {
  final List<Exam> exams;

  const ExamList({
    super.key,
    required this.exams
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 80.0),
      itemCount: exams.length,
      itemBuilder: (ctx, index) {
        return ExamCard(exam: exams[index]);
      },
    );
  }
}