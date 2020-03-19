import 'package:flutter/material.dart';
import 'dart:math';

/// Entry point to our application.
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            title: Text('Dicey'),
            backgroundColor: Colors.red,
          ),
          body: DicePage(),
        ),
      )
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  Random random = Random.secure();

  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void roll() {
    setState(() {
      leftDiceNumber = 6 - random.nextInt(6);
      rightDiceNumber = 6 - random.nextInt(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
              child: FlatButton(
                onPressed: () {
                  roll();
                },
                child: Image.asset('images/dice$leftDiceNumber.png'),
              )
          ),
          Expanded(
              child: FlatButton(
                onPressed: () {
                  roll();
                },
                child: Image.asset('images/dice$rightDiceNumber.png'),
              )
          ),
        ],
      ),
    );
  }
}
