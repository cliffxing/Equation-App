//imports
import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorPage extends StatefulWidget {
  @override
  CalculatorPageState createState() => CalculatorPageState();
}

class CalculatorPageState extends State<CalculatorPage> {
  double num1 = 0, num2 = 1, answer = 0; //variables

//controller to receive user input
  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();

//method for addition
  void addition() {
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);

      answer = num1 + num2;
    });
  }

//method for subtraction
  void subtraction() {
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);

      answer = num1 - num2;
    });
  }

//method for multiplication
  void multiplication() {
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);

      answer = num1 * num2;
    });
  }

//method for division
  void division() {
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);

      answer = num1 / num2;
    });
  }

//build statement
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        //overall scaffold
        appBar: AppBar(
          //creates app bar
          backgroundColor: Colors.black,
          elevation: 1.0,
          centerTitle: true,
          title: new Text("Calculator"),
        ),
        body: new Container(
            //container holding widgets
            padding: const EdgeInsets.all(40.0), //padding for container
            child: new Column(
                //column holding widgets vertically
                mainAxisAlignment: MainAxisAlignment.center, //centers widget
                children: [
                  //list of widgets
                  new Text(
                      //text
                      "Enter the two numbers you would like to perform operations on: ",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(flex: 1), //spaces out
                  new TextField(
                    keyboardType: TextInputType
                        .number, //ensures textfield only takes numbers
                    decoration: new InputDecoration(hintText: "Number 1"),
                    controller: t1, //points controller variable to variable
                  ),
                  Spacer(), //spaces out
                  new TextField(
                    keyboardType: TextInputType
                        .number, //ensures textfield only takes numbers
                    decoration: new InputDecoration(hintText: "Number 2"),
                    controller: t2, //points controller variable to variable
                  ),
                  Spacer(), //spaces out
                  new Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, //centers widgets
                      children: [
                        //list of widgets
                        //buttons
                        new RaisedButton(
                            color: Colors.blue[300],
                            child: new Text("     +     "),
                            onPressed: addition),
                        new RaisedButton(
                            color: Colors.red[300],
                            child: new Text("     -     "),
                            onPressed: subtraction),
                        new RaisedButton(
                            color: Colors.green[300],
                            child: new Text("     x     "),
                            onPressed: multiplication),
                        new RaisedButton(
                            color: Colors.purple[300],
                            child: new Text("     ÷     "),
                            onPressed: division),
                      ]),
                  Spacer(flex: 3), //spaces out
                  new Text("Answer: " + answer.toString(),
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(flex: 7), //spaces out
                ])));
  }
}
