import 'package:dartflutter_despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> dbTransactions;
  const TransactionList(this.dbTransactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400,
        child: dbTransactions.isNotEmpty
            ? ListView.builder(
                itemCount: dbTransactions.length,
                itemBuilder: (context, index) => Card(
                    child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                            'R\$ ${dbTransactions[index].value.toStringAsFixed(2)}')),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dbTransactions[index].title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat('d MMM y')
                              .format(dbTransactions[index].date),
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                )),
              )
            : Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: const Text('Sem Transações'),
                  ),
                  SizedBox(height: 200,child: Image.asset('assets/images/waiting.png'))
                ],
              ));
  }
}
