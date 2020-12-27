import 'package:flutter/material.dart';

import './physics1.dart';
import './physics2.dart';
import './physics3.dart';
import './physics4.dart';
import './physics5.dart';

class PhysicsPage extends StatefulWidget {
  @override
  PhysicsPageState createState() => PhysicsPageState();
}

class PhysicsPageState extends State<PhysicsPage> {
  Widget build(BuildContext ctx) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 1.0,
          centerTitle: true,
          title: new Text("Choose an Equation:"),
        ),
        body: Container(
          height: MediaQuery.of(ctx).size.height,
          width: MediaQuery.of(ctx).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Physics1Page(),
                  ));
                },
                child: Text("Equation #1 (No Acceleration)"),
              ),
              Spacer(),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Physics2Page(),
                  ));
                },
                child: Text("Equation #2 (No Displacement)"),
              ),
              Spacer(),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Physics3Page(),
                  ));
                },
                child: Text("Equation #3 (No Final Velocity)"),
              ),
              Spacer(),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Physics4Page(),
                  ));
                },
                child: Text("Equation #4 (No Time)"),
              ),
              Spacer(),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Physics5Page(),
                  ));
                },
                child: Text("Equation #5 (No Initial Velocity)"),
              ),
              Spacer(flex: 3),
            ],
          ),
        ));
  }
}
