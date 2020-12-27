import 'package:flutter/material.dart';

import 'dart:math';

class Physics3Page extends StatefulWidget {
  @override
  Physics3PageState createState() => Physics3PageState();
}

class Physics3PageState extends State<Physics3Page> {
  double time = 0,
      displace = 0,
      initialv = 0,
      acceleration = 0,
      answer = 0,
      answer2 = 0;
  bool isFindTime = false;
  String units = "";

  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();
  final TextEditingController t3 = new TextEditingController();
  final TextEditingController t4 = new TextEditingController();

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

  Widget build(BuildContext ctx) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 1.0,
          centerTitle: true,
          title: new Text("Equation #3"),
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
                        new InputDecoration(hintText: "Enter Acceleration"),
                    controller: t1,
                  ),
                  Spacer(),
                  new TextField(
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(hintText: "Enter Time"),
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
                        new InputDecoration(hintText: "Enter Displacement"),
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
                            child: new Text("Find Time!"),
                            onPressed: findT),
                        new RaisedButton(
                            color: Colors.blue,
                            child: new Text("Find Initial Velocity!"),
                            onPressed: findVi),
                        new RaisedButton(
                            color: Colors.blue,
                            child: new Text("Find Displacement!"),
                            onPressed: findD),
                      ]),
                  Spacer(flex: 3),
                  new Text(
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
                  Spacer(flex: 7),
                ])));
  }
}
