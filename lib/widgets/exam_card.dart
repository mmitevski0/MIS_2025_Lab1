import 'package:flutter/material.dart';

import '../models/exam_model.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final bool isFutureExam = exam.dateTime.isAfter(DateTime.now());

    final Color cardColor = isFutureExam ? Colors.lightBlue.shade500 : Colors.green.shade500;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/exam-details", arguments: exam);
      },
      child: Card(
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                exam.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const Divider(height: 12,),

              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 16, color: Colors.white),
                  const SizedBox(width: 8,),
                  Text(
                    DateFormat('dd.MM.yyyy').format(exam.dateTime),
                  ),
                  const SizedBox(width: 20,),
                  const Icon(Icons.access_time, size: 16, color: Colors.white),
                  const SizedBox(width: 8,),
                  Text(
                    DateFormat('HH:mm').format(exam.dateTime)
                  ),
                ],
              ),

              const SizedBox(height: 8,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on, size: 16, color: Colors.white,),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: Text(
                      exam.rooms.join(', ')
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );

  }
}