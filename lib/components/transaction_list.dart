import 'package:dartflutter_despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> dbTransactions;
  final Function(String) onRemove;
  const TransactionList(this.dbTransactions, {Key? key, required this.onRemove})
      : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400,
        child: dbTransactions.isNotEmpty
            ? ListView.builder(
                itemCount: dbTransactions.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    leading: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                            'R\$ ${dbTransactions[index].value.toStringAsFixed(2)}')),
                    title: Text(
                      dbTransactions[index].title,
                    ),
                    titleTextStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    subtitle: Text(
                      DateFormat('d MMM y').format(dbTransactions[index].date),
                    ),
                    subtitleTextStyle: const TextStyle(color: Colors.grey),
                    trailing: IconButton(
                      onPressed: () => onRemove(dbTransactions[index].id),
                      icon: const Icon(Icons.delete_forever_outlined),
                    ),
                  ),
                ),
              )
            : Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: const Text('Sem Transações'),
                  ),
                  SizedBox(
                      height: 200,
                      child: Image.asset('assets/images/waiting.png'))
                ],
              ));
  }
}
