import 'dart:math';

import 'package:dartflutter_despesas_pessoais/components/transaction_form_modal.dart';
import 'package:dartflutter_despesas_pessoais/components/transaction_list.dart';
import 'package:dartflutter_despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> dbTransactions = [
    Transaction(id: 'id', title: 'title', value: 18.2, date: DateTime.now()),
  ];

  _addTransactions(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      dbTransactions.add(newTransaction);
    });
  }

  _showModalTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (_) => TransactionForm(_addTransactions));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoais"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      bottomNavigationBar: const BottomAppBar(
        height: 35,
        shape: CircularNotchedRectangle(),
      ),
      body: Column(
        children: [
          // TransactionForm(_addTransactions),
          TransactionList(dbTransactions),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showModalTransaction(context),
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
