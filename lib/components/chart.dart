import 'package:dartflutter_despesas_pessoais/components/chart_bar.dart';
import 'package:dartflutter_despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> dbTransactions;
  const Chart(this.dbTransactions, {Key? key}) : super(key: key);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalValue = 0;

      for (int x = 0; x < dbTransactions.length; x++) {
        bool sameDay = dbTransactions[x].date.day == weekDay.day;
        bool sameMonth = dbTransactions[x].date.month == weekDay.month;
        bool sameYear = dbTransactions[x].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalValue += dbTransactions[x].value;
        }
      }

      return {'day': DateFormat.E().format(weekDay)[0], 'value': totalValue};
    });
  }

  double get totalValueWeek {
    return groupedTransactions.fold(
        0.0,
        (previousValue, element) =>
            previousValue += element['value'] as double);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          
          children: groupedTransactions
              .map((e) => ChartBar(
                  sufWeekDay: e['day'].toString(),
                  value: e['value'] as double,
                  porcent: (e['value'] as double) / totalValueWeek))
              .toList()),
    );
  }
}
