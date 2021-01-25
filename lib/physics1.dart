//import
import 'package:flutter/material.dart';

class Physics1Page extends StatefulWidget {
  @override
  Physics1PageState createState() => Physics1PageState();
}

//state build
class Physics1PageState extends State<Physics1Page> {
  double time = 0,
      finalv = 0,
      initialv = 0,
      displace = 0,
      answer = 0; //variables
  String units = ""; //string for units after answer

//text controls for userinput
  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();
  final TextEditingController t3 = new TextEditingController();
  final TextEditingController t4 = new TextEditingController();

  //method solving for displacement
  void findD() {
    setState(() {
      time = double.parse(t2.text);
      initialv = double.parse(t3.text);
      finalv = double.parse(t4.text);

      units = "metres";
      answer = ((initialv + finalv) / 2) * time;
    });
  }

//method solving for time
  void findT() {
    setState(() {
      displace = double.parse(t1.text);
      initialv = double.parse(t3.text);
      finalv = double.parse(t4.text);

      units = "seconds";
      answer = (2 * displace) / (initialv + finalv);
    });
  }

//method solving for intial velocity
  void findVi() {
    setState(() {
      displace = double.parse(t1.text);
      time = double.parse(t2.text);
      finalv = double.parse(t4.text);

      units = "metres per second";
      answer = ((2 * displace) / time) - finalv;
    });
  }

//method solving for final velocity
  void findVf() {
    setState(() {
      displace = double.parse(t1.text);
      time = double.parse(t2.text);
      initialv = double.parse(t3.text);

      units = "metres per second";
      answer = ((2 * displace) / time) - initialv;
    });
  }

//state build
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        //overall scaffold
        resizeToAvoidBottomInset:
            false, //ensures that keyboard doesn't throw renderflex error
        appBar: AppBar(
          //app bar
          backgroundColor: Colors.black,
          elevation: 1.0,
          centerTitle: true,
          title: new Text("Equation #1"),
        ),
        body: new Container(
            //container holding textfields, text, buttons, etc.
            padding: const EdgeInsets.all(40.0), //padding for container
            child: new Column(
                //column holding widgets
                mainAxisAlignment: MainAxisAlignment.center, //centres
                children: [
                  //children list
                  new Text(
                      "Enter The Following Values (Leave the value you are looking for BLANK and press the button with what you are looking for written on it): ", //instructions
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(flex: 1),
                  new TextField(
                    keyboardType: TextInputType
                        .number, //ensures textfield only takes numbers
                    decoration:
                        new InputDecoration(hintText: "Enter Displacement"),
                    controller: t1, //points controller to variable
                  ),
                  Spacer(),
                  new TextField(
                    keyboardType: TextInputType
                        .number, //ensures textfield only takes numbers
                    decoration: new InputDecoration(hintText: "Enter Time"),
                    controller: t2, //points controller to variable
                  ),
                  Spacer(),
                  new TextField(
                    keyboardType: TextInputType
                        .number, //ensures textfield only takes numbers
                    decoration:
                        new InputDecoration(hintText: "Enter Initial Velocity"),
                    controller: t3, //points controller to variable
                  ),
                  Spacer(),
                  new TextField(
                    keyboardType: TextInputType
                        .number, //ensures textfield only takes numbers
                    decoration:
                        new InputDecoration(hintText: "Enter Final Velocity"),
                    controller: t4, //points controller to variable
                  ),
                  Spacer(), //spaces out
                  new Column(
                      //column holding widgets
                      mainAxisAlignment: MainAxisAlignment.center, //centers
                      children: [
                        //buttons
                        new RaisedButton(
                            color: Colors.blue[300],
                            child: new Text("  Find Displacement!  ",
                                style: TextStyle(
                                    fontFamily: 'BebasNeue', fontSize: 24)),
                            onPressed: findD), //calculates on pressed
                        new RaisedButton(
                            color: Colors.blue[300],
                            child: new Text("            Find Time!           ",
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
                          units, //text to display answers on screen
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(flex: 7), //spaces out
                ])));
  }
}
