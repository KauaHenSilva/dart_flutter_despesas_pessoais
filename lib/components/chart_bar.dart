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
        Text(
          'R\$${value.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 12),
        ),
        SizedBox(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              FractionallySizedBox(
                heightFactor: porcent.isNaN ? 0 : porcent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              )
            ],
          ),
        ),
        Text(
          sufWeekDay,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
