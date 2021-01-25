//imports
import 'package:flutter/material.dart';

import 'dart:math'; //math import for quadratic

class Physics3Page extends StatefulWidget {
  @override
  Physics3PageState createState() => Physics3PageState();
}

class Physics3PageState extends State<Physics3Page> {
  //variables
  double time = 0,
      displace = 0,
      initialv = 0,
      acceleration = 0,
      answer = 0,
      answer2 = 0;
  bool isFindTime = false;
  String units = "";

//controllers to take in text
  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();
  final TextEditingController t3 = new TextEditingController();
  final TextEditingController t4 = new TextEditingController();

//method to calculate acceleration
  void findA() {
    setState(() {
      isFindTime = false;
      time = double.parse(t2.text);
      initialv = double.parse(t3.text);
      displace = double.parse(t4.text);

      units = "metres per second squared";
      answer = (2 * (displace - (initialv * time)) / (pow(time, 2)));
    });
  }

//method to calculate time
  void findT() {
    setState(() {
      isFindTime = true;
      acceleration = double.parse(t1.text);
      initialv = double.parse(t3.text);
      displace = double.parse(t4.text);

      units = "seconds";
      answer = (-initialv +
              sqrt((pow(initialv, 2)) -
                  (4 * (acceleration / 2) * (-displace)))) /
          acceleration;
      answer2 = (-initialv -
              sqrt((pow(initialv, 2)) -
                  (4 * (acceleration / 2) * (-displace)))) /
          acceleration;
    });
  }

//method to calculate initial velocity
  void findVi() {
    setState(() {
      isFindTime = false;
      acceleration = double.parse(t1.text);
      time = double.parse(t2.text);
      displace = double.parse(t4.text);

      units = "metres per second";
      answer = (displace - (0.5 * acceleration * pow(time, 2))) / time;
    });
  }

//method to calculate displacemoent
  void findD() {
    setState(() {
      isFindTime = false;
      acceleration = double.parse(t1.text);
      time = double.parse(t2.text);
      initialv = double.parse(t3.text);

      units = "metres";
      answer = (initialv * time) + ((acceleration * pow(time, 2)) / 2);
    });
  }

//build statement
  Widget build(BuildContext ctx) {
    return Scaffold(
        //overall scaffold
        resizeToAvoidBottomInset:
            false, //ensures that the keyboard doesn't throw renderflex error
        appBar: AppBar(
          //app bar
          backgroundColor: Colors.black,
          elevation: 1.0,
          centerTitle: true,
          title: new Text("Equation #3"),
        ),
        body: new Container(
            //container to hold all widgets
            padding: const EdgeInsets.all(40.0), //padding
            child: new Column(
                //holds all widgets vertically
                mainAxisAlignment: MainAxisAlignment.center, //centers widgets
                children: [
                  // list of widgets
                  new Text(
                      //text
                      "Enter The Following Values (Leave the value you are looking for BLANK and press the button with what you are looking for written on it): ",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(flex: 1), //spaces out
                  new TextField(
                    //textfield to receive input from text
                    keyboardType: TextInputType
                        .number, //ensures that textfield only takes numbers
                    decoration:
                        new InputDecoration(hintText: "Enter Acceleration"),
                    controller: t1, //points textfield to variable
                  ),
                  Spacer(), //spaces out
                  new TextField(
                    //textfield to receive input from text
                    keyboardType: TextInputType
                        .number, //ensures that textfield only takes numbers
                    decoration: new InputDecoration(hintText: "Enter Time"),
                    controller: t2, //points textfield to variable
                  ),
                  Spacer(), //spaces out
                  new TextField(
                    keyboardType: TextInputType
                        .number, //textfield to receive input from text
                    decoration:
                        new InputDecoration(hintText: "Enter Initial Velocity"),
                    controller: t3, //points textfield to variable
                  ),
                  Spacer(), //spaces out
                  new TextField(
                    keyboardType: TextInputType
                        .number, //textfield to receive input from text
                    decoration:
                        new InputDecoration(hintText: "Enter Displacement"),
                    controller: t4, //points textfield to variable
                  ),
                  Spacer(), //spaces out
                  new Column(
                      //new column holding buttons
                      mainAxisAlignment:
                          MainAxisAlignment.center, //centers widgets
                      children: [
                        //list of widgets
                        new RaisedButton(
                            //buttons
                            color: Colors.blue[300],
                            child: new Text("  Find Acceleration!  ",
                                style: TextStyle(
                                    fontFamily: 'BebasNeue', fontSize: 24)),
                            onPressed: findA), //calculates on pressed
                        new RaisedButton(
                            color: Colors.blue[300],
                            child: new Text("           Find Time!           ",
                                style: TextStyle(
                                    fontFamily: 'BebasNeue', fontSize: 24)),
                            onPressed: findT), //calculates on pressed
                        new RaisedButton(
                            color: Colors.blue[300],
                            child: new Text("Find Initial Velocity!",
                                style: TextStyle(
                                    fontFamily: 'BebasNeue', fontSize: 24)),
                            onPressed: findVi), //calculates on pressed
                        new RaisedButton(
                            color: Colors.blue[300],
                            child: new Text("  Find Displacement!  ",
                                style: TextStyle(
                                    fontFamily: 'BebasNeue', fontSize: 24)),
                            onPressed: findD), //calculates on pressed
                      ]),
                  Spacer(flex: 3), //spaces out
                  new Text(
                      //displays text on screen
                      isFindTime == false
                          ? "Answer: " +
                              answer.toString() +
                              " " +
                              units //if required to find time statement
                          : "Answer: " + //else statement (not finding time)
                              answer.toString() +
                              " " +
                              units +
                              " or " +
                              answer2.toString() +
                              " " +
                              units,
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(flex: 7), //spaces out
                ])));
  }
}
