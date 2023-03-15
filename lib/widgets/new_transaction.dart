import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime? _selectedDate = DateTime.now();

  void _onSubmitData() {
    final enteredInput = titleController.text;
    final enteredNumber = double.parse(amountController.text);
    if (enteredInput.isEmpty || enteredNumber <= 0) {
      return;
    }

    widget.addTransaction(enteredInput, enteredNumber, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(), // provide a default value
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => _onSubmitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _onSubmitData(),
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Text(DateFormat.yMd()
                          .format(_selectedDate ?? DateTime.now()) ??
                      ''),
                  Expanded(
                    child: TextButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        "Choose Date",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: TextButton.styleFrom(
                          foregroundColor: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _onSubmitData,
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  // foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                  ),
            )
          ],
        ),
      ),
    );
  }
}
