import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './bar_chart.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      ); // get the day before
      double totalSum = 0;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year)
          totalSum += recentTransactions[i].amount;
      }

      // for (Transaction tx in recentTransactions) {
      //   if (tx.date.day == weekDay.day &&
      //       tx.date.month == weekDay.month &&
      //       tx.date.year == weekDay.year)
      //     totalSum += tx.amount;

      // }
      print(DateFormat.E().format(weekDay));

      print(totalSum);
      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum
      }; // DateFormat.E() returns
      //respective day to the weekDay
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: groupedTransactionValues.map((tx) {
            return Flexible(
              fit: FlexFit.tight,
              child: BarChart(
                  tx["day"] as String,
                  (tx['amount'] as double),
                  totalSpending == 0.0
                      ? 0.0
                      : (tx["amount"] as double) / totalSpending),
            );
          }).toList() as List<Widget>,
        ),
      ),
    );
  }
}
