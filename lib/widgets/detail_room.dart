import 'package:flutter/material.dart';

class DetailRoom extends StatelessWidget{
  final String roomName;

  const DetailRoom({
    super.key,
    required this.roomName,
});

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 34.0, bottom: 4.0),
      child: Row(
        children: [
          const Icon(Icons.meeting_room, size: 18, color:  Colors.green),
          const SizedBox(width: 8,),
          Text(
            roomName,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}