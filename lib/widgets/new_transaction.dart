import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewtransaction;

  NewTransaction(this.addNewtransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) return;

    widget.addNewtransaction(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                autofocus: true,
                enabled: true,
                decoration: InputDecoration(labelText: "Title"),
                controller: titleController,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"),
                controller: amountController,
                onSubmitted: (_) => submitData(),
              ),
              FlatButton(
                  onPressed: submitData,
                  child: Text("Add Transaction",
                      style: TextStyle(color: Colors.purple)))
            ],
          ),
        ));
  }
}