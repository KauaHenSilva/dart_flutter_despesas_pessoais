import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final Function(String, double) onAddTransaction;
  const TransactionForm(this.onAddTransaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleControler = TextEditingController();
    final valueControler = TextEditingController();

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
                    onPressed: () => onAddTransaction(
                        titleControler.text, double.tryParse(valueControler.text) ?? 0),
                    child: const Text("Nova Transação")))
          ],
        ),
      ),
    );
  }
}
