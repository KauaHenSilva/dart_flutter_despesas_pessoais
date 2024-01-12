import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionFormModal extends StatefulWidget {
  final Function(String, double, DateTime) onAddTransaction;

  const TransactionFormModal(this.onAddTransaction, {Key? key})
      : super(key: key);

  @override
  State<TransactionFormModal> createState() => _TransactionFormModalState();
}

class _TransactionFormModalState extends State<TransactionFormModal> {
  final titleControler = TextEditingController();
  final valueControler = TextEditingController();
  DateTime _dateTime = DateTime.now();

  _formatToDb() {
    final String title = titleControler.text;
    final double value = double.tryParse(valueControler.text) ?? 0;

    if (!(title.isEmpty || value.isNegative || value == 0)) {
      widget.onAddTransaction(title, value, _dateTime);
    }

    Navigator.of(context).pop();
  }

  _showPickerCalendar() {
    showDatePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 364 * 4)),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        _dateTime = value as DateTime;
      });
    });
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
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Text(DateFormat('dd/MM/y').format(_dateTime)),
                  TextButton(
                      onPressed: _showPickerCalendar,
                      child: const Icon(Icons.calendar_month_outlined)),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.only(top: 15),
              child: TextButton(
                onPressed: _formatToDb,
                child: const Text("Nova Transação"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
