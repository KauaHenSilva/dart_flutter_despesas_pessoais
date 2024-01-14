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
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: constraints.maxHeight * 0.2,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                'R\$${value.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.6,
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
          Container(
            alignment: Alignment.center,
            height: constraints.maxHeight * 0.2,
            child: Text(
              sufWeekDay,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
