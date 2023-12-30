import 'dart:math';

import 'package:dartflutter_despesas_pessoais/components/transaction_form.dart';
import 'package:dartflutter_despesas_pessoais/components/transaction_list.dart';
import 'package:dartflutter_despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final List<Transaction> db = [
    Transaction(id: 'id', title: 'title', value: 18.2, date: DateTime.now()),
  ];

  _addTransactions(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      db.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addTransactions),
        TransactionList(db),
      ],
    );
  }
}
