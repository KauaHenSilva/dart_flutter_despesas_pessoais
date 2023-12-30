import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final TextEditingController titleControler;
  final TextEditingController valueControler;
  const TransactionForm(this.titleControler, this.valueControler, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
