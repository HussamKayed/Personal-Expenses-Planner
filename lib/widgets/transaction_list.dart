import 'package:flutter/material.dart';

import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delete;

  const TransactionList(this.transactions, this.delete);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (context, constraints) {
              return Column(
                children: <Widget>[
                  Text("No transactions added yet!",
                      style: Theme.of(context).textTheme.headline6),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      child: Image.asset(
                        "assets/images/waiting.png",
                        fit: BoxFit.cover,
                      ),
                      height: constraints.maxHeight * 0.7)
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionItem(
                    transaction: transactions[index], delete: delete);
              },
              itemCount: transactions.length,
            ),
    );
  }
}
