import 'package:flutter/material.dart';
import '/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: transactions.map((transaction) {
          return Container(
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
                        child: Text(DateFormat("yMEd").format(transaction.date),
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
        }).toList()),
      ),
    );
  }
}
