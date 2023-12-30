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
  final transactionDados = [
    Transaction(id: 'id', title: 'title', value: 18.2, date: DateTime.now()),
    Transaction(id: 'id', title: 'title', value: 18.0, date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(transactionDados),
        const TransactionForm()
      ],
    );
  }
}
