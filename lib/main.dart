import 'dart:math';

import 'package:dartflutter_despesas_pessoais/components/chart.dart';
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
  List<Transaction> dbTransactions = [];

  List<Transaction> get _recentDbTransactions {
    return dbTransactions.where((element) {
      return element.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  _addTransactions(String title, double value, DateTime time) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: time,
    );

    setState(() {
      dbTransactions.add(newTransaction);
    });
  }

  _removeTransaction(String id) {
    setState(() {
      dbTransactions.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  _showModalTransaction(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) => TransactionFormModal(_addTransactions),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bottomAppBar = BottomAppBar(
      height: 35,
      shape: CircularNotchedRectangle(),
    );

    final appBar = AppBar(
      title: const Text("Despesas Pessoais"),
      backgroundColor: Colors.deepPurpleAccent,
    );

    final labelSize = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        bottomAppBar.height! -
        appBar.preferredSize.height;

    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: bottomAppBar,
      body: Column(
        children: [
          SizedBox(
            height: labelSize * 0.2,
            child: Chart(_recentDbTransactions),
          ),
          SizedBox(
            height: labelSize * 0.8,
            child: TransactionList(
              dbTransactions,
              onRemove: _removeTransaction,
            ),
          ),
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
