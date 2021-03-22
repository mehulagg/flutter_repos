import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/user_transactions.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
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
      body: Column(
       
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.teal,
              child: Container(
                width: 100,
                child: Text(
                  'Chart',
                ),
              ),
              elevation: 5.0,
              shadowColor: Colors.white38,
            ),
          ),
          UserTransactions(),
        ],
      ),
    );
  }
}
