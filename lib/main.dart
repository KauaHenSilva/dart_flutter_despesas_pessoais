import 'dart:math';

import 'package:flutter/services.dart';

import './components/chart.dart';
import './components/transaction_form_modal.dart';
import './components/transaction_list.dart';
import './models/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Despesas Pessoais',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
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

  bool isChart = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    const bottomAppBar = BottomAppBar(
      height: 35,
      shape: CircularNotchedRectangle(),
    );

    final appBar = AppBar(
      title: const Text("Despesas Pessoais"),
      centerTitle: true,
      actions: [
        if (isLandscape)
          Switch(
            value: isChart,
            onChanged: (value) => setState(() {
              isChart = value;
            }),
            thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return const Icon(Icons.bar_chart_rounded);
              }
              return const Icon(Icons
                  .list); // All other states will use the default thumbIcon.
            }),
          )
      ],
    );

    final labelSize = mediaQuery.size.height -
        mediaQuery.padding.top -
        appBar.preferredSize.height -
        bottomAppBar.height!;

    return Scaffold(
      appBar: appBar,
      body: !isLandscape
          ? Column(
              children: [
                SizedBox(
                  height: labelSize * 0.3,
                  child: Chart(_recentDbTransactions),
                ),
                SizedBox(
                  height: labelSize * 0.7,
                  child: TransactionList(
                    dbTransactions,
                    onRemove: _removeTransaction,
                  ),
                ),
              ],
            )
          : !isChart
              ? SizedBox(
                  height: labelSize * 1,
                  child: TransactionList(
                    dbTransactions,
                    onRemove: _removeTransaction,
                  ),
                )
              : SizedBox(
                  height: labelSize * 1,
                  child: Chart(_recentDbTransactions),
                ),
      bottomNavigationBar: bottomAppBar,
      floatingActionButton: !isChart
          ? FloatingActionButton(
              onPressed: () => _showModalTransaction(context),
              shape: const CircleBorder(),
              child: const Icon(Icons.add),
            )
          : null,
      floatingActionButtonLocation:
          !isChart ? FloatingActionButtonLocation.miniCenterDocked : null,
    );
  }
}
