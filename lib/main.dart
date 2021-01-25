//package imports
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

//page imports
import './quadratic.dart';
import './calculator.dart';
import './physics.dart';
import './sketch.dart';

//main method
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]) //ensures that app can only be used in upright mode
      .then((_) {
    runApp(new MyApp()); //kickstarts UI of app
  });
}

//widget build statement
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

//homepage's state
class HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(ctx).size.height, //sets height of app
      width: MediaQuery.of(ctx).size.width, //sets width
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/math.jpg'),
              fit: BoxFit.cover)), //background image set
      child: Column(
        //column containing buttons
        //alignment parameters:
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        //list of widgets in column:
        children: [
          Spacer(flex: 8), //spaces out the top of app
          RaisedButton(
            shape: StadiumBorder(), //sets shape of button
            color: Colors.blue[100], //color of button
            splashColor: Colors.blueAccent, //blue accent animation when pressed
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => QuadraticPage(), //page push statement
              ));
            },
            child: Text(
              "Quadratic Equation Calculator", //text of button
              style: TextStyle(
                  fontSize: 25, fontFamily: 'BebasNeue'), //size and font
            ),
          ),
          Spacer(), //spaces out the buttons
          RaisedButton(
            //creates another button
            shape: StadiumBorder(), //shape
            color: Colors.blue[100], //sets color
            splashColor: Colors.blueAccent, //color animation when clicked
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PhysicsPage(), //page push statement
              ));
            },
            child: Text(
              //text in button
              "Physics Equation Calculator",
              style: TextStyle(
                  fontSize: 25, fontFamily: 'BebasNeue'), //font and size
            ),
          ),
          Spacer(), //spaces out the buttons
          RaisedButton(
            //creates another button
            shape: StadiumBorder(), //sets shape
            color: Colors.blue[100], //color of button
            splashColor: Colors.blueAccent, //color animation when clicked
            onPressed: () {
              //print('hello world');
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CalculatorPage(), //page push statement
              ));
            },
            child: Text(
              "Operation Calculator",
              style: TextStyle(
                  fontSize: 25, fontFamily: 'BebasNeue'), //font and size
            ),
          ),
          Spacer(), //spaces out buttons
          RaisedButton(
            //creates new button
            shape: StadiumBorder(), //shape
            color: Colors.blue[100], //color of button
            splashColor: Colors.blueAccent, //color animation when clicked
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SketchPage(), //page push statement
              ));
            },
            child: Text(
              "Sketch",
              style: TextStyle(
                  fontSize: 25, fontFamily: 'BebasNeue'), //font and size
            ),
          ),
          Spacer(
              flex: 2), //final spacer to push contents in children list upwards
        ],
      ),
    ));
  }
}
