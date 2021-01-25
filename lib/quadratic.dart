//imports
import 'package:flutter/material.dart';
import 'dart:math'; //math import for calculations

//state build
class QuadraticPage extends StatefulWidget {
  @override
  QuadraticPageState createState() => QuadraticPageState();
}

class QuadraticPageState extends State<QuadraticPage> {
  double num1 = 1, num2 = 0, num3 = 0, r1 = 0, r2 = 0; //variables

//Text editing controllers (to receive user input):
  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();
  final TextEditingController t3 = new TextEditingController();

//method that calculates two roots of quadratic equation
  void findRoots() {
    setState(() {
      //calculations are done in a set state, so that the state can be updated and text can be displayed
      //receives numbers from text controllers and converts to a double
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      num3 = double.parse(t3.text);

      r1 = (-num2 + sqrt(pow(num2, 2) - (4 * num1 * num3))) /
          (2 * num1); //root 1
      r2 = (-num2 - sqrt(pow(num2, 2) - (4 * num1 * num3))) /
          (2 * num1); //root 2
    });
  }

  //build statement
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        //overall scaffold
        appBar: AppBar(
          //creates app bar at the top
          backgroundColor: Colors.black,
          elevation: 1.0,
          centerTitle: true,
          title: new Text("ax² + bx + c = 0"), //text in app bar
        ),
        body: new Container(
            padding: const EdgeInsets.all(
                40.0), //padding of container that holds textfields
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center, //centers column
                children: [
                  //children list holding widgets
                  new Text(
                      "Enter The Following Values (If no value for a is entered, it will be assumed as 1): ", //instruction text
                      textAlign: TextAlign.center, //centers text
                      style: new TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(
                      flex:
                          1), //spacer between instructions and first textfield
                  new TextField(
                    //creates textfield to receive user input
                    keyboardType:
                        TextInputType.number, //sets text field to only numbers
                    decoration: new InputDecoration(
                        hintText:
                            "Enter \'a\' value (Do not enter 0)"), //text inside of text controller
                    controller: t1, //points controller to t1 variable
                  ),
                  SizedBox(height: 30), //spaces out text field
                  new TextField(
                    //creates textfield widget
                    keyboardType:
                        TextInputType.number, //sets text field to only numbers
                    decoration: new InputDecoration(
                        hintText:
                            "Enter \'b\' value"), //text inside of text controller
                    controller: t2, //points controller to t1 variable
                  ),
                  SizedBox(height: 30), //spaces out text field
                  new TextField(
                    //creates textfield widget
                    keyboardType:
                        TextInputType.number, //sets text field to only numbers
                    decoration: new InputDecoration(
                        hintText:
                            "Enter \'c\' value"), //text inside of text controller
                    controller: t3, //points controller to t1 variable
                  ),
                  SizedBox(
                      height: 30), //spaces out between textfield and button
                  new Row(
                      //row holding button
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new RaisedButton(
                            //button
                            color: Colors.red,
                            child: new Text("       Calculate!      ",
                                style: TextStyle(
                                    fontFamily: 'BebasNeue', fontSize: 24)),
                            onPressed:
                                findRoots), //onpressed the button points towards the findroots method which calculates
                      ]),
                  SizedBox(height: 30), //spaces out
                  new Text(
                      "Roots: " +
                          r1.toString() +
                          "  and  " +
                          r2.toString(), //converts roots to string and prints to screen (initially 0)
                      style: new TextStyle(
                          //font settings
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(flex: 7), //spaces out
                ])));
  }
}
