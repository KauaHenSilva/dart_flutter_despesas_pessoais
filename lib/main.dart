import 'package:dartflutter_despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
  final dados = [
    Transaction(title: 'title', id: 'id', value: 14, date: DateTime.now()),
    Transaction(title: 'title', id: 'id', value: 14, date: DateTime.now()),
    Transaction(title: 'title', id: 'id', value: 14, date: DateTime.now()),
    Transaction(title: 'title', id: 'id', value: 14, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoais"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Card(
            child: Text("Text"),
          ),
          Column(
            children: [
              ...dados.map((e) => Card(child: Text(e.title)))
            ],
          )
        ],
      ),
    );
  }
}