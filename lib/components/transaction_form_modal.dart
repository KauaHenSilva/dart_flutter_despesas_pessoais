import 'package:flutter/material.dart';

class TransactionFormModal extends StatefulWidget {
  final Function(String, double) onAddTransaction;

  const TransactionFormModal(this.onAddTransaction, {Key? key}) : super(key: key);

  @override
  State<TransactionFormModal> createState() => _TransactionFormModalState();
}

class _TransactionFormModalState extends State<TransactionFormModal> {
  final titleControler = TextEditingController();
  final valueControler = TextEditingController();

  _formatToDb() {
    final String title = titleControler.text;
    final double value = double.tryParse(valueControler.text) ?? 0;

    if (!(title.isEmpty || value.isNegative || value == 0)) {
      widget.onAddTransaction(title, value);
    }

    Navigator.of(context).pop();
  }

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
                    onPressed: _formatToDb,
                    child: const Text("Nova Transação")))
          ],
        ),
      ),
    );
  }
}
