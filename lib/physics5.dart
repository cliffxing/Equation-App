//imports
import 'package:flutter/material.dart';

import 'dart:math'; //math import

class Physics5Page extends StatefulWidget {
  @override
  Physics5PageState createState() => Physics5PageState();
}

class Physics5PageState extends State<Physics5Page> {
  double time = 0, //variables
      displace = 0,
      finalv = 0,
      acceleration = 0,
      answer = 0,
      answer2 = 0;
  bool isFindTime = false;
  String units = "";

//controllers
  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();
  final TextEditingController t3 = new TextEditingController();
  final TextEditingController t4 = new TextEditingController();

//method to find acceleration
  void findA() {
    setState(() {
      isFindTime = false;
      time = double.parse(t2.text);
      finalv = double.parse(t3.text);
      displace = double.parse(t4.text);

      units = "metres per second squared";
      answer = (2 * ((finalv * time) - displace) / (pow(time, 2)));
    });
  }

//method to find time
  void findT() {
    setState(() {
      isFindTime = true;
      acceleration = double.parse(t1.text);
      finalv = double.parse(t3.text);
      displace = double.parse(t4.text);

      units = "seconds";
      answer = (finalv +
              sqrt((pow(finalv, 2)) - (4 * (acceleration / 2) * (displace)))) /
          acceleration;
      answer2 = (finalv -
              sqrt((pow(finalv, 2)) - (4 * (acceleration / 2) * (displace)))) /
          acceleration;
    });
  }

//method to find final velocity
  void findVf() {
    setState(() {
      isFindTime = false;
      acceleration = double.parse(t1.text);
      time = double.parse(t2.text);
      displace = double.parse(t4.text);

      units = "metres per second";
      answer = ((displace + ((acceleration * (pow(time, 2))) / 2)) / time);
    });
  }

//method to find displacement
  void findD() {
    setState(() {
      isFindTime = false;
      acceleration = double.parse(t1.text);
      time = double.parse(t2.text);
      finalv = double.parse(t3.text);

      units = "metres";
      answer = (finalv * time) - ((acceleration * pow(time, 2)) / 2);
    });
  }

//build statement
  Widget build(BuildContext ctx) {
    return Scaffold(
        resizeToAvoidBottomInset:
            false, //ensures keyboard doesn't throw renderflex error
        appBar: AppBar(
          //creates appbar
          backgroundColor: Colors.black,
          elevation: 1.0,
          centerTitle: true,
          title: new Text("Equation #5"),
        ),
        body: new Container(
            //container for widgets
            padding: const EdgeInsets.all(40.0), //padding for container
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center, //centers widgets
                children: [
                  //list of widgets
                  new Text(
                      "Enter The Following Values (Leave the value you are looking for BLANK and press the button with what you are looking for written on it): ",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(flex: 1), //spaces out
                  new TextField(
                    //textfield to take user input
                    keyboardType: TextInputType.number,
                    decoration:
                        new InputDecoration(hintText: "Enter Acceleration"),
                    controller: t1, //points towards variable
                  ),
                  Spacer(), //spaces out
                  new TextField(
                    //textfield to take user input
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(hintText: "Enter Time"),
                    controller: t2, //points towards variable
                  ),
                  Spacer(), //spaces out
                  new TextField(
                    //textfield to take user input
                    keyboardType: TextInputType.number,
                    decoration:
                        new InputDecoration(hintText: "Enter Final Velocity"),
                    controller: t3, //points towards variable
                  ),
                  Spacer(),
                  new TextField(
                    //textfield to take user input
                    keyboardType: TextInputType.number,
                    decoration:
                        new InputDecoration(hintText: "Enter Displacement"),
                    controller: t4, //points towards variable
                  ),
                  Spacer(), //spaces out
                  new Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, //centers widgets
                      children: [
                        //buttons
                        new RaisedButton(
                            color: Colors.blue[300],
                            child: new Text("Find Acceleration!",
                                style: TextStyle(
                                    fontFamily: 'BebasNeue', fontSize: 24)),
                            onPressed: findA), //calculates on pressed
                        new RaisedButton(
                            color: Colors.blue[300],
                            child: new Text("          Find Time!          ",
                                style: TextStyle(
                                    fontFamily: 'BebasNeue', fontSize: 24)),
                            onPressed: findT), //calculates on pressed
                        new RaisedButton(
                            color: Colors.blue[300],
                            child: new Text("Find Final Velocity!",
                                style: TextStyle(
                                    fontFamily: 'BebasNeue', fontSize: 24)),
                            onPressed: findVf), //calculates on pressed
                        new RaisedButton(
                            color: Colors.blue[300],
                            child: new Text("Find Displacement!",
                                style: TextStyle(
                                    fontFamily: 'BebasNeue', fontSize: 24)),
                            onPressed: findD), //calculates on pressed
                      ]),
                  Spacer(flex: 3), //spaces out
                  new Text(
                      //outputs text to screen
                      isFindTime == false
                          ? "Answer: " + answer.toString() + " " + units
                          : "Answer: " +
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
