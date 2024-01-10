import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String sufWeekDay;
  final double value;
  final double porcent;

  const ChartBar({
    Key? key,
    required this.sufWeekDay,
    required this.value,
    required this.porcent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value.toStringAsFixed(2)),
        Stack(
          children: [
            Container(
              height: 60,
              width: 10,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            FractionallySizedBox(
              
            )
          ],
        ),
        Text(sufWeekDay),
      ],
    );
  }
}
