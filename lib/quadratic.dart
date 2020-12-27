import 'package:flutter/material.dart';
import 'dart:math';

class QuadraticPage extends StatefulWidget {
  @override
  QuadraticPageState createState() => QuadraticPageState();
}

class QuadraticPageState extends State<QuadraticPage> {
  double num1 = 1, num2 = 0, num3 = 0, r1 = 0, r2 = 0;

  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();
  final TextEditingController t3 = new TextEditingController();

  void findRoots() {
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      num3 = double.parse(t3.text);

      r1 = (-num2 + sqrt(pow(num2, 2) - (4 * num1 * num3))) / (2 * num1);
      r2 = (-num2 - sqrt(pow(num2, 2) - (4 * num1 * num3))) / (2 * num1);
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 1.0,
          centerTitle: true,
          title: new Text("ax² + bx + c = 0"),
        ),
        body: new Container(
            padding: const EdgeInsets.all(40.0),
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Text(
                      "Enter The Following Values (If no value for a is entered, it will be assumed as 1): ",
                      style: new TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(flex: 1),
                  new TextField(
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        hintText: "Enter \'a\' value (Do not enter 0)"),
                    controller: t1,
                  ),
                  Spacer(),
                  new TextField(
                    keyboardType: TextInputType.number,
                    decoration:
                        new InputDecoration(hintText: "Enter \'b\' value"),
                    controller: t2,
                  ),
                  Spacer(),
                  new TextField(
                    keyboardType: TextInputType.number,
                    decoration:
                        new InputDecoration(hintText: "Enter \'c\' value"),
                    controller: t3,
                  ),
                  Spacer(),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new RaisedButton(
                            color: Colors.red,
                            child: new Text("Calculate!"),
                            onPressed: findRoots),
                      ]),
                  Spacer(flex: 3),
                  new Text(
                      "Roots: " + r1.toString() + "  and  " + r2.toString(),
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(flex: 7),
                ])));
  }
}
