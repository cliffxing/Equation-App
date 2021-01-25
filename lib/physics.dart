//imports
import 'package:flutter/material.dart';

//page import
import './physics1.dart';
import './physics2.dart';
import './physics3.dart';
import './physics4.dart';
import './physics5.dart';

class PhysicsPage extends StatefulWidget {
  @override
  PhysicsPageState createState() => PhysicsPageState();
}

//state build
class PhysicsPageState extends State<PhysicsPage> {
  Widget build(BuildContext ctx) {
    return Scaffold(
        //overall scaffold
        appBar: AppBar(
          //creates app bar at top
          backgroundColor: Colors.black,
          elevation: 1.0,
          centerTitle: true,
          title: new Text("Choose an Equation:"),
        ),
        body: Container(
          height: MediaQuery.of(ctx)
              .size
              .height, //sets height of container to height of device
          width: MediaQuery.of(ctx)
              .size
              .width, //sets height of container to height of device
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, //centres buttons
            mainAxisAlignment: MainAxisAlignment.center, //centres buttons
            children: [
              //children list of column
              Spacer(flex: 2), //spacer
              RaisedButton(
                //creates button

                color: Colors.blue[200], //sets color of button
                onPressed: () {
                  //function for when button is pressed
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Physics1Page(), //pushes to page
                  ));
                },
                child: Text("   Equation #1 (No Acceleration)   ",
                    style: TextStyle(
                        fontFamily: 'BebasNeue', fontSize: 24)), //text
              ),
              Spacer(), //spaces out
              RaisedButton(
                //creates button
                color: Colors.blue[200], //sets color of button
                onPressed: () {
                  //function for when button is pressed
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Physics2Page(), //pushes to page
                  ));
                },
                child: Text(
                  "  Equation #2 (No Displacement)  ",
                  style:
                      TextStyle(fontFamily: 'BebasNeue', fontSize: 24), //text
                ),
              ),
              Spacer(), //spaces out
              RaisedButton(
                //creates button
                color: Colors.blue[200], //sets color of button
                onPressed: () {
                  //function for when button is pressed
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Physics3Page(), //pushes to page
                  ));
                },
                child: Text(" Equation #3 (No Final Velocity) ",
                    style: TextStyle(
                        fontFamily: 'BebasNeue', fontSize: 24)), //text
              ),
              Spacer(), //spaces out
              RaisedButton(
                //creates button
                color: Colors.blue[200], //sets color of button
                onPressed: () {
                  //function for when button is pressed
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Physics4Page(), //pushes to page
                  ));
                },
                child: Text("           Equation #4 (No Time)           ",
                    style: TextStyle(
                        fontFamily: 'BebasNeue', fontSize: 24)), //text
              ),
              Spacer(), //spaces out
              RaisedButton(
                //creates button
                color: Colors.blue[200], //sets color of button
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Physics5Page(), //pushes page
                  ));
                },
                child: Text("Equation #5 (No Initial Velocity)",
                    style: TextStyle(
                        fontFamily: 'BebasNeue', fontSize: 24)), //text
              ),
              Spacer(flex: 3), //spaces out
            ],
          ),
        ));
  }
}
