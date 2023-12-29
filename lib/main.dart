import 'package:dartflutter_despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    Transaction(id: 'id', title: 'title', value: 18.2, date: DateTime.now()),
    Transaction(id: 'id', title: 'title', value: 18.0, date: DateTime.now())
  ];

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Card(child: Text("Ola")),
          Column(
            children: [
              ...dados.map((e) => Card(
                    child: Row(children: [
                      Container(
                          margin: const EdgeInsets.all(15),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.deepPurpleAccent),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            e.value.toString(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurpleAccent[100]),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat('d MMM y').format(e.date),
                            style: const TextStyle(
                               color: Colors.grey
                            ),
                          )
                        ],
                      )
                    ]),
                  ))
            ],
          )
        ],
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
