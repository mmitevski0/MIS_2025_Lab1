import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import '../data/exam_data.dart';
import '../widgets/exam_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  late List<Exam> sortedExams;

  @override
  void initState() {
    super.initState();
    sortedExams = List.from(examList);
    sortedExams.sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  @override
  Widget build(BuildContext context) {
    final int totalExams = sortedExams.length;

    return Scaffold(
      appBar: AppBar(
        title: Text("Распоред за испити - 213222"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: ExamList(exams: sortedExams),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Chip(
          backgroundColor: Colors.red,
          label: Text(
            "Вкупен број испити: $totalExams",
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
      ),
    );
  }
}