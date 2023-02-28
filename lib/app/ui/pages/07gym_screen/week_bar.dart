import 'package:flutter/material.dart';

class WeekBar extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String day;
  final Color dayColor;
  final String date;
  const WeekBar({
    super.key,
    required this.color,
    required this.textColor,
    required this.day,
    required this.date,
    required this.dayColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          shape: BoxShape.rectangle,
          border: Border.fromBorderSide(
            BorderSide(
              color: dayColor,
              width: 1,
            ),
          )),
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(
              fontSize: 14,
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            date,
            style: TextStyle(
              fontSize: 10,
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Icon(
            Icons.check_circle,
            color: textColor,
            size: 20,
          )
        ],
      ),
    );
  }
}
