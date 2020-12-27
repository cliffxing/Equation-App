import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './quadratic.dart';
import './calculator.dart';
import './physics.dart';

void main() => runApp(MyApp());

final ThemeData themeData = ThemeData(
  canvasColor: Colors.lightBlueAccent,
  accentColor: Colors.purpleAccent,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(home: Homepage());
  }
}

class Homepage extends StatefulWidget {
  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(ctx).size.height,
      width: MediaQuery.of(ctx).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/math.jpg'), fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 4),
          RaisedButton(
            shape: StadiumBorder(),
            color: Colors.blue[100],
            splashColor: Colors.blueAccent,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => QuadraticPage(),
              ));
            },
            child: Text(
              "Quadratic Equation Calculator",
              style: TextStyle(fontSize: 25, fontFamily: 'BebasNeue'),
            ),
          ),
          Spacer(),
          RaisedButton(
            shape: StadiumBorder(),
            color: Colors.blue[100],
            splashColor: Colors.blueAccent,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PhysicsPage(),
              ));
            },
            child: Text(
              "Physics Equation Calculator",
              style: TextStyle(fontSize: 25, fontFamily: 'BebasNeue'),
            ),
          ),
          Spacer(),
          RaisedButton(
            shape: StadiumBorder(),
            color: Colors.blue[100],
            splashColor: Colors.blueAccent,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CalculatorPage(),
              ));
            },
            child: Text(
              "Operation Calculator",
              style: TextStyle(fontSize: 25, fontFamily: 'BebasNeue'),
            ),
          ),
          Spacer(flex: 3),
        ],
      ),
    ));
  }
}
