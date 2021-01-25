//imports
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './main.dart';

class SketchPage extends StatefulWidget {
  @override
  SketchPageState createState() => SketchPageState();
}

class SketchPageState extends State<SketchPage> {
  List<Offset> points =
      <Offset>[]; //list containing all user gestures and poiunts
  //variables
  Color selectedColor;
  double strokeWidth;

  Widget build(BuildContext ctx) {
    //build statement
    selectedColor = Colors.black;
    strokeWidth = 2.0;

    final double width =
        MediaQuery.of(ctx).size.width; //sets height to height of container
    final double height =
        MediaQuery.of(ctx).size.height; //sets width to width of container

    return Scaffold(
        //overall scaffold
        body: Stack(children: <Widget>[
      //list of widgets
      Container(color: Colors.black),
      Center(
          child: Column(
              //column holding widgets vertically
              crossAxisAlignment: CrossAxisAlignment.center, //centers
              mainAxisAlignment: MainAxisAlignment.center, //centers
              children: <Widget>[
            RaisedButton(
              color: Colors.blue[100],
              child: Text('Back to Home Screen',
                  style: TextStyle(
                    fontFamily: 'BebasNeue',
                    fontSize: 30,
                  )),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        Homepage())); //pushes back to homepage
              },
            ),
            Container(
                width: width * 0.77, //container for canvas
                height: height * 0.77, //container for canvas
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.4), //canavs color
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      )
                    ]),
                child: GestureDetector(
                    //widget to get user input
                    onPanDown: (details) {
                      //on touch
                      this.setState(() {
                        points.add(details.localPosition); //add points
                      });
                    },
                    onPanUpdate: (details) {
                      //on 'swipe'
                      this.setState(() {
                        points.add(details.localPosition); //add points
                      });
                    },
                    onPanEnd: (details) {
                      //on raise
                      this.setState(() {
                        points.add(null); //add points
                      });
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: new CustomPaint(
                          painter: new MyCustomPainter(
                              points: points), //calls custom painter class
                        )))),
            SizedBox(
              height: 20, //spaces out
            ),
            Container(
                //container that holds icon button at bottom
                width: width * 0.80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, //centers
                  children: <Widget>[
                    //list of icon
                    IconButton(
                        icon: Icon(Icons.layers_clear),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  SketchPage())); //pushes new page
                        }),
                  ],
                )),
          ])),
    ]));
  }
}

//paint class
class MyCustomPainter extends CustomPainter {
  List<Offset> points; //list of points
  MyCustomPainter({this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = Colors.white;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);

//paint variables
    Paint paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 2.0;
    paint.isAntiAlias = true;
    paint.strokeCap = StrokeCap.round;

//for loop that paints according to the list
    for (int x = 0; x < points.length - 1; x++) {
      if (points[x] != null &&
          points[x + 1] != null) //if the next point is not null, paint "line"
      {
        canvas.drawLine(points[x], points[x + 1], paint); //draws line
      } else if (points[x] != null &&
          points[x + 1] == null) //if the next point is null, paint "point"
      {
        canvas.drawPoints(PointMode.points, [points[x]], paint); //draws point
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    //TODO: implement shouldRepaint

    return true;
  }
}
