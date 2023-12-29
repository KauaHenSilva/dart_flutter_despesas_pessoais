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
  var dados = [
    Transaction(title: 'title', id: 'id', value: 12, date: DateTime.now()),
    Transaction(title: 'title', id: 'id', value: 12, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoais"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Card(
            child: Text("data"),
          ),
          Column(
            children: [
              ...dados.map((e) => Card(
                      child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.all(15),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.deepPurpleAccent),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            e.value.toString(),
                            style: const TextStyle(
                                color: Colors.deepPurpleAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                      Column(
                        children: [Text(e.title), Text(e.date.toString())],
                      )
                    ],
                  )))
            ],
          )
        ],
      ),
      bottomNavigationBar: const BottomAppBar(
        height: 35,
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
