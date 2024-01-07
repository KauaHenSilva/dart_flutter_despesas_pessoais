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
        bool sameDay = DateTime.now().day == weekDay.day;
        bool sameMonth = DateTime.now().month == weekDay.month;
        bool sameYear = DateTime.now().year == weekDay.year;

        if (sameDay || sameMonth || sameYear) {
          totalValue += dbTransactions[x].value;
        }
      }

      return {'day': DateFormat.E().format(weekDay)[0], 'value': totalValue};
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Row(children: []),
    );
  }
}
