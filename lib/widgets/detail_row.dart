import 'package:flutter/material.dart';

class DetailRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final bool isHighlight;

  const DetailRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.isHighlight = false,
});

  @override
  Widget build(BuildContext context){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: isHighlight ? Colors.red.shade700 : Colors.indigo, size: 24,),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: isHighlight ? Colors.red.shade700 : Colors.black87,
                  fontWeight:  isHighlight ? FontWeight.bold : FontWeight.w500,
                ),
              ),

              const SizedBox(height: 2,),
              Text(
                value,
                style: TextStyle(
                  fontSize: isHighlight ? 20 : 16,
                  fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
                  color: isHighlight ? Colors.red.shade900 : Colors.black,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

}