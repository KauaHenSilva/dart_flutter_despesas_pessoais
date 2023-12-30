import 'package:dartflutter_despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final titleControler = TextEditingController();
    final valueControler = TextEditingController();

    final dados = [
      Transaction(id: 'id', title: 'title', value: 18.2, date: DateTime.now()),
      Transaction(id: 'id', title: 'title', value: 18.0, date: DateTime.now())
    ];

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
          ...dados.map(
            (e) => Card(
                child: Row(
              children: [
                Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text('R\$ ${e.value.toStringAsFixed(2)}')),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat('d MMM y').format(e.date),
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            )),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: titleControler,
                    decoration: const InputDecoration(labelText: 'Titulo'),
                  ),
                  TextField(
                    controller: valueControler,
                    decoration: const InputDecoration(labelText: 'Valor'),
                  ),
                  Container(
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.only(top: 15),
                      child: TextButton(
                          onPressed: () {
                            print(titleControler.text);
                            print(valueControler.text);
                          },
                          child: const Text("Nova Transação")))
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
