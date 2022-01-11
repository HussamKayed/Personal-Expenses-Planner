import 'dart:math';

import 'package:flutter/material.dart';

import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  final Function delete;

  const TransactionList(this.transactions, this.delete);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  late Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.blue,
      Colors.amber,
      Colors.purple,
      Colors.red
    ];
    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.transactions.isEmpty
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
                    transaction: widget.transactions[index],
                    delete: widget.delete);
              },
              itemCount: widget.transactions.length,
            ),
    );
  }
}
