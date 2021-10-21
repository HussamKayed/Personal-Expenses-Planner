import "package:flutter/material.dart";
import "package:intl/intl.dart";

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.delete,
  }) : super(key: key);

  final Transaction transaction;
  final Function delete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 5,
      color: Colors.grey[350],
      child: ListTile(
        leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: EdgeInsets.all(6),
              child: FittedBox(child: Text("\$${transaction.amount}")),
            )),
        title: Text(transaction.title,
            style: Theme.of(context).textTheme.headline6),
        subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                onPressed: () => delete(transaction.id),
                icon: Icon(Icons.delete_outline_outlined),
                textColor: Theme.of(context).errorColor,
                label: Text("delete"))
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => delete(transaction.id),
              ),
      ),
    );
  }
}
