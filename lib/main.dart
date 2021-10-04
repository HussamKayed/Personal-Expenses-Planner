import 'package:flutter/material.dart';
import 'package:second_app/widgets/user_transactions.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: ListView(
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
          UserTransactions()
        ],
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    );
  }
}
