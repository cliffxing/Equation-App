//imports
import 'package:flutter/material.dart';

class Physics2Page extends StatefulWidget {
  @override
  Physics2PageState createState() => Physics2PageState();
}

class Physics2PageState extends State<Physics2Page> {
  double time = 0,
      finalv = 0,
      initialv = 0,
      acceleration = 0,
      answer = 0; //variables
  String units = ""; //units of final answer

//controllers
  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();
  final TextEditingController t3 = new TextEditingController();
  final TextEditingController t4 = new TextEditingController();

//method to find acceleration
  void findA() {
    setState(() {
      time = double.parse(t2.text);
      initialv = double.parse(t3.text);
      finalv = double.parse(t4.text);

      units = "metres per second squared";
      answer = (finalv - initialv) / acceleration;
    });
  }

//method to find time
  void findT() {
    setState(() {
      acceleration = double.parse(t1.text);
      initialv = double.parse(t3.text);
      finalv = double.parse(t4.text);

      units = "seconds";
      answer = (finalv - initialv) / acceleration;
    });
  }

//method to find initial velocity
  void findVi() {
    setState(() {
      acceleration = double.parse(t1.text);
      time = double.parse(t2.text);
      finalv = double.parse(t4.text);

      units = "metres per second";
      answer = finalv - (acceleration * time);
    });
  }

//method to find final velocity
  void findVf() {
    setState(() {
      acceleration = double.parse(t1.text);
      time = double.parse(t2.text);
      initialv = double.parse(t3.text);

      units = "metres per second";
      answer = initialv + (acceleration * time);
    });
  }

//build statement
  Widget build(BuildContext ctx) {
    return Scaffold(
        //overall scaffold
        resizeToAvoidBottomInset:
            false, //ensures that keyboard doesn't throw rederflex error
        appBar: AppBar(
          //creates app bar
          backgroundColor: Colors.black,
          elevation: 1.0,
          centerTitle: true,
          title: new Text("Equation #2"),
        ),
        body: new Container(
            //overall container holding widgets
            padding: const EdgeInsets.all(40.0),
            child: new Column(
                //column holding widgets
                mainAxisAlignment: MainAxisAlignment.center, //centres
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
                    //text field that takes input
                    keyboardType: TextInputType
                        .number, //sets form to only take in numbers
                    decoration:
                        new InputDecoration(hintText: "Enter Acceleration"),
                    controller: t1,
                  ),
                  Spacer(), //spaces out
                  new TextField(
                    //text field that takes input
                    keyboardType: TextInputType
                        .number, //sets form to only take in numbers
                    decoration: new InputDecoration(hintText: "Enter Time"),
                    controller: t2,
                  ),
                  Spacer(),
                  new TextField(
                    //text field that takes input
                    keyboardType: TextInputType
                        .number, //sets form to only take in numbers
                    decoration:
                        new InputDecoration(hintText: "Enter Initial Velocity"),
                    controller: t3,
                  ),
                  Spacer(),
                  new TextField(
                    //text field that takes input
                    keyboardType: TextInputType
                        .number, //sets form to only take in numbers
                    decoration:
                        new InputDecoration(hintText: "Enter Final Velocity"),
                    controller: t4,
                  ),
                  Spacer(),
                  new Column(
                      //column of buttons
                      mainAxisAlignment: MainAxisAlignment.center, //centers
                      children: [
                        //list of buttons
                        new RaisedButton(
                            //creates button
                            color: Colors.blue[300], //color of button
                            child: new Text("   Find Acceleration!   ", //text
                                style: TextStyle(
                                    fontFamily: 'BebasNeue', fontSize: 24)),
                            onPressed: findA), //calls calculate function
                        new RaisedButton(
                            //creates button
                            color: Colors.blue[300], //color of button
                            child: new Text(
                                "            Find Time!            ", //text
                                style: TextStyle(
                                    fontFamily: 'BebasNeue', fontSize: 24)),
                            onPressed: findT), //calls calculate function
                        new RaisedButton(
                            //creates button
                            color: Colors.blue[300], //color of button
                            child: new Text(" Find Initial Velocity! ", //text
                                style: TextStyle(
                                    fontFamily: 'BebasNeue', fontSize: 24)),
                            onPressed: findVi), //calls calculate function
                        new RaisedButton(
                            //creates button
                            color: Colors.blue[300], //color of button
                            child: new Text("  Find Final Velocity!  ", //text
                                style: TextStyle(
                                    fontFamily: 'BebasNeue', fontSize: 24)),
                            onPressed: findVf), //calls calculate function
                      ]),
                  Spacer(flex: 3), //spaces out
                  new Text(
                      "Answer: " +
                          answer.toString() +
                          " " +
                          units, //outputs text to screen
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(flex: 7), //spaces out
                ])));
  }
}
