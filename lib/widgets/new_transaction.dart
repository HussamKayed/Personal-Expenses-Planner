import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewtransaction;

  NewTransaction(this.addNewtransaction);
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
                  controller: titleController),
              TextField(
                  decoration: InputDecoration(labelText: "Amount"),
                  controller: amountController),
              FlatButton(
                  onPressed: () {
                    addNewtransaction(titleController.text,
                        double.parse(amountController.text));
                  },
                  child: Text("Add Transaction",
                      style: TextStyle(color: Colors.purple)))
            ],
          ),
        ));
  }
}
