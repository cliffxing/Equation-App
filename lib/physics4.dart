//imports
import 'package:flutter/material.dart';

import 'dart:math'; //math import

class Physics4Page extends StatefulWidget {
  @override
  Physics4PageState createState() => Physics4PageState();
}

class Physics4PageState extends State<Physics4Page> {
  double displace = 0,
      finalv = 0,
      initialv = 0,
      acceleration = 0,
      answer = 0; //variables
  String units = ""; //units for final answer

//controllers to receive user input
  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();
  final TextEditingController t3 = new TextEditingController();
  final TextEditingController t4 = new TextEditingController();

//method to find displacement
  void findD() {
    setState(() {
      acceleration = double.parse(t2.text);
      initialv = double.parse(t3.text);
      finalv = double.parse(t4.text);

      units = "metres";
      answer = (pow(finalv, 2) - pow(initialv, 2)) / (2 * acceleration);
    });
  }

//method to find acceleration
  void findA() {
    setState(() {
      displace = double.parse(t1.text);
      initialv = double.parse(t3.text);
      finalv = double.parse(t4.text);

      units = "meters per second squared";
      answer = (pow(finalv, 2) - pow(initialv, 2)) / (2 * displace);
    });
  }

//method to find initial velocity
  void findVi() {
    setState(() {
      displace = double.parse(t1.text);
      acceleration = double.parse(t2.text);
      finalv = double.parse(t4.text);

      units = "metres per second (plus or minus)";
      answer = sqrt((pow(finalv, 2) - (2 * acceleration * displace)));
    });
  }

//method to find final velocity
  void findVf() {
    setState() {
      displace = double.parse(t1.text);
      acceleration = double.parse(t2.text);
      initialv = double.parse(t3.text);

      units = "metres per second (plus or minus)";
      answer = sqrt((pow(initialv, 2) - (2 * acceleration * displace)));
    }
  }

//build statement
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        //overall scaffold
        resizeToAvoidBottomInset:
            false, //ensures that the keyboard does not throw renderflex error
        appBar: AppBar(
          //creates app bar
          backgroundColor: Colors.black,
          elevation: 1.0,
          centerTitle: true,
          title: new Text("Equation #4"),
        ),
        body: new Container(
            //container holding widgets
            padding: const EdgeInsets.all(40.0), //padding of container
            child: new Column(
                //column containing widgets
                mainAxisAlignment: MainAxisAlignment.center, //centers
                children: [
                  //list of widgets
                  new Text(
                      "Enter The Following Values (Leave the value you are looking for BLANK and press the button with what you are looking for written on it): ", //text
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(flex: 1), //spaces out
                  new TextField(
                    keyboardType: TextInputType
                        .number, //ensures that textfield only takes numbers
                    decoration:
                        new InputDecoration(hintText: "Enter Displacement"),
                    controller: t1, //points controller to variable
                  ),
                  Spacer(),
                  new TextField(
                    keyboardType: TextInputType
                        .number, //ensures that textfield only takes numbers
                    decoration:
                        new InputDecoration(hintText: "Enter Acceleration"),
                    controller: t2, //points controller to variable
                  ),
                  Spacer(), //spaces out
                  new TextField(
                    keyboardType: TextInputType
                        .number, //ensures that textfield only takes numbers
                    decoration:
                        new InputDecoration(hintText: "Enter Initial Velocity"),
                    controller: t3, //points controller to variable
                  ),
                  Spacer(), //spaces out
                  new TextField(
                    keyboardType: TextInputType
                        .number, //ensures that textfield only takes numbers
                    decoration:
                        new InputDecoration(hintText: "Enter Final Velocity"),
                    controller: t4, //points controller to variable
                  ),
                  Spacer(), //spaces out
                  new Column(
                      //contains for widgets vertically
                      mainAxisAlignment: MainAxisAlignment.center, //centers
                      children: [
                        //button widgets
                        new RaisedButton(
                            color: Colors.blue[300],
                            child: new Text("  Find Acceleration!  ",
                                style: TextStyle(
                                    fontFamily: 'BebasNeue', fontSize: 24)),
                            onPressed: findA), //calculates on pressed
                        new RaisedButton(
                            color: Colors.blue[300],
                            child: new Text(" Find Displacement! ",
                                style: TextStyle(
                                    fontFamily: 'BebasNeue', fontSize: 24)),
                            onPressed: findD), //calculates on pressed
                        new RaisedButton(
                            color: Colors.blue[300],
                            child: new Text("Find Initial Velocity!",
                                style: TextStyle(
                                    fontFamily: 'BebasNeue', fontSize: 24)),
                            onPressed: findVi), //calculates on pressed
                        new RaisedButton(
                            color: Colors.blue[300],
                            child: new Text(" Find Final Velocity! ",
                                style: TextStyle(
                                    fontFamily: 'BebasNeue', fontSize: 24)),
                            onPressed: findVf), //calculates on pressed
                      ]),
                  Spacer(flex: 3), //spaces out
                  new Text(
                      "Answer: " +
                          answer.toString() +
                          " " +
                          units, //displays text to screen
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(flex: 7), //spaces out
                ])));
  }
}
