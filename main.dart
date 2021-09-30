import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';
import 'transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction("1", 4, DateTime.now(), "Groceries"),
    Transaction("2", 3, DateTime.now(), "Tomatoes"),
    Transaction("2", 3, DateTime.now(), "Food"),
    Transaction("2", 3, DateTime.now(), "Food")
  ];

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Container(
              child: Text(
                "Chart",
              ),
              width: double.infinity,
              color: Colors.blue,
            ),
            elevation: 5,
          ),
          Card(
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
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Amount"),
                      controller: amountController,
                    ),
                    FlatButton(
                        onPressed: () {
                          print(titleController.text);
                          print(amountController.text);
                        },
                        child: Text("Add Transaction",
                            style: TextStyle(color: Colors.purple)))
                  ],
                ),
              )),
          Column(
              children: transactions.map((transaction) {
            return new TransactionList(
                transaction.title, transaction.amount, transaction.date);
          }).toList())
        ],
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }
}
