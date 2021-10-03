import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'package:intl/intl.dart';

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
    Transaction("2", 3, DateTime.now(), "Tomatoes")
  ];

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
                    ),
                    TextField(decoration: InputDecoration(labelText: "Amount")),
                    FlatButton(
                        onPressed: () {},
                        child: Text("Add Transaction",
                            style: TextStyle(color: Colors.purple)))
                  ],
                ),
              )),
          Column(
              children: transactions.map((transaction) {
            return Container(
              child: Card(
                child: Row(
                  children: <Widget>[
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        padding: EdgeInsets.all(5),
                        child: Text("\€" + transaction.amount.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.red))),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(transaction.title,
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800)),
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.purpleAccent),
                              color: Colors.red.shade100),
                        ),
                        Container(
                          child: Text(
                              DateFormat("yMEd").format(transaction.date),
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800)),
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.purpleAccent),
                              color: Colors.red.shade100),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }).toList())
        ],
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }
}
