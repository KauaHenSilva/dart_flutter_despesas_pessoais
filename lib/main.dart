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
      title: 'Despesas Pessoais',
      theme: ThemeData(
        fontFamily: 'OpenSans',
        brightness: Brightness.dark,
      ),
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
    Transaction(id: 'id', title: 'title', value: 18.2, date: DateTime.now().subtract(const Duration(days: 1))),
    Transaction(id: 'id', title: 'title', value: 18.2, date: DateTime.now().subtract(const Duration(days: 2))),
    Transaction(id: 'id', title: 'title', value: 18.2, date: DateTime.now().subtract(const Duration(days: 3))),
    Transaction(id: 'id', title: 'title', value: 18.2, date: DateTime.now().subtract(const Duration(days: 4))),
    Transaction(id: 'id', title: 'title', value: 18.2, date: DateTime.now().subtract(const Duration(days: 5))),
    Transaction(id: 'id', title: 'title', value: 18.2, date: DateTime.now().subtract(const Duration(days: 6))),
    Transaction(id: 'id', title: 'title', value: 18.2, date: DateTime.now().subtract(const Duration(days: 7))),
  ];

  Iterable<Transaction> get _recentDbTransactions {
    return dbTransactions.where((element) {
      return element.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    });
  }

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
        context: context,
        builder: (_) => TransactionFormModal(_addTransactions));
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
