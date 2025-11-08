import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam_model.dart';
import '../widgets/detail_room.dart';
import '../widgets/detail_row.dart';

class DetailsPage extends StatelessWidget{
  const DetailsPage({super.key});

  String _getRemainingTime(DateTime examDate){
    final DateTime now = DateTime.now();

    if(examDate.isBefore(now)){
      return 'Испитот е поминат.';
    }

    final Duration difference = examDate.difference(now);

    final int days = difference.inDays;
    final int hours = difference.inHours % 24;

    return '$days дена, $hours часа';
  }

  @override
  Widget build(BuildContext context){
    final exam = ModalRoute.of(context)!.settings.arguments as Exam;

    final String dateString = DateFormat('dd.MM.yyyy').format(exam.dateTime);
    final String timeString = DateFormat('HH:mm').format(exam.dateTime);
    final String fulldateTimeString = '$dateString во $timeString часот';
    final String timeRemaining = _getRemainingTime(exam.dateTime);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Детален преглед'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exam.name,
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.indigo),
              ),
              const Divider(height: 30, thickness: 2,),

              DetailRow(
                icon: Icons.timer,
                title: 'Останато време до испитот:',
                value: timeRemaining,
                isHighlight: true,
              ),
              const SizedBox(height: 10,),

              DetailRow(
                icon: Icons.calendar_month,
                title: 'Датум и време:',
                value: fulldateTimeString,
              ),
              const SizedBox(height: 20,),

              const Text(
                'Простории:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5,),
              ...exam.rooms.map((room) => DetailRoom(roomName: room)).toList(),
            ],
          ),
        ),
      ),
    );
  }
}