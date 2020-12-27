import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorPage extends StatefulWidget {
  @override
  CalculatorPageState createState() => CalculatorPageState();
}

class CalculatorPageState extends State<CalculatorPage> {
  double num1 = 0, num2 = 1, answer = 0;

  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();

  void addition() {
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);

      answer = num1 + num2;
    });
  }

  void subtraction() {
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);

      answer = num1 - num2;
    });
  }

  void multiplication() {
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);

      answer = num1 * num2;
    });
  }

  void division() {
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);

      answer = num1 / num2;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 1.0,
          centerTitle: true,
          title: new Text("Calculator"),
        ),
        body: new Container(
            padding: const EdgeInsets.all(40.0),
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Text(
                      "Enter the two numbers you would like to perform operations on: ",
                      style: new TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(flex: 1),
                  new TextField(
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(hintText: "Number 1"),
                    controller: t1,
                  ),
                  Spacer(),
                  new TextField(
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(hintText: "Number 2"),
                    controller: t2,
                  ),
                  Spacer(),
                  new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new RaisedButton(
                            color: Colors.blue,
                            child: new Text("+"),
                            onPressed: addition),
                        new RaisedButton(
                            color: Colors.red,
                            child: new Text("-"),
                            onPressed: subtraction),
                        new RaisedButton(
                            color: Colors.green,
                            child: new Text("x"),
                            onPressed: multiplication),
                        new RaisedButton(
                            color: Colors.purple,
                            child: new Text("÷"),
                            onPressed: division),
                      ]),
                  Spacer(flex: 3),
                  new Text("Answer: " + answer.toString(),
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(flex: 7),
                ])));
  }
}
