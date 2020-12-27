import 'package:flutter/material.dart';

import 'dart:math';

class Physics4Page extends StatefulWidget {
  @override
  Physics4PageState createState() => Physics4PageState();
}

class Physics4PageState extends State<Physics4Page> {
  double displace = 0, finalv = 0, initialv = 0, acceleration = 0, answer = 0;
  String units = "";

  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();
  final TextEditingController t3 = new TextEditingController();
  final TextEditingController t4 = new TextEditingController();

  void findD() {
    setState(() {
      acceleration = double.parse(t2.text);
      initialv = double.parse(t3.text);
      finalv = double.parse(t4.text);

      units = "metres";
      answer = (pow(finalv, 2) - pow(initialv, 2)) / (2 * acceleration);
    });
  }

  void findA() {
    setState(() {
      displace = double.parse(t1.text);
      initialv = double.parse(t3.text);
      finalv = double.parse(t4.text);

      units = "meters per second squared";
      answer = (pow(finalv, 2) - pow(initialv, 2)) / (2 * displace);
    });
  }

  void findVi() {
    setState(() {
      displace = double.parse(t1.text);
      acceleration = double.parse(t2.text);
      finalv = double.parse(t4.text);

      units = "metres per second (plus or minus)";
      answer = sqrt((pow(finalv, 2) - (2 * acceleration * displace)));
    });
  }

  void findVf() {
    setState() {
      displace = double.parse(t1.text);
      acceleration = double.parse(t2.text);
      initialv = double.parse(t3.text);

      units = "metres per second (plus or minus)";
      answer = sqrt((pow(initialv, 2) - (2 * acceleration * displace)));
    }
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 1.0,
          centerTitle: true,
          title: new Text("Equation #4"),
        ),
        body: new Container(
            padding: const EdgeInsets.all(40.0),
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Text(
                      "Enter The Following Values (Leave the value you are looking for BLANK and press the button with what you are looking for written on it): ",
                      style: new TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(flex: 1),
                  new TextField(
                    keyboardType: TextInputType.number,
                    decoration:
                        new InputDecoration(hintText: "Enter Displacement"),
                    controller: t1,
                  ),
                  Spacer(),
                  new TextField(
                    keyboardType: TextInputType.number,
                    decoration:
                        new InputDecoration(hintText: "Enter Acceleration"),
                    controller: t2,
                  ),
                  Spacer(),
                  new TextField(
                    keyboardType: TextInputType.number,
                    decoration:
                        new InputDecoration(hintText: "Enter Initial Velocity"),
                    controller: t3,
                  ),
                  Spacer(),
                  new TextField(
                    keyboardType: TextInputType.number,
                    decoration:
                        new InputDecoration(hintText: "Enter Final Velocity"),
                    controller: t4,
                  ),
                  Spacer(),
                  new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new RaisedButton(
                            color: Colors.blue,
                            child: new Text("Find Acceleration!"),
                            onPressed: findA),
                        new RaisedButton(
                            color: Colors.blue,
                            child: new Text("Find Displacement!"),
                            onPressed: findD),
                        new RaisedButton(
                            color: Colors.blue,
                            child: new Text("Find Initial Velocity!"),
                            onPressed: findVi),
                        new RaisedButton(
                            color: Colors.blue,
                            child: new Text("Find Final Velocity!"),
                            onPressed: findVf),
                      ]),
                  Spacer(flex: 3),
                  new Text("Answer: " + answer.toString() + " " + units,
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(flex: 7),
                ])));
  }
}
