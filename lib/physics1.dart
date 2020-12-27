import 'package:flutter/material.dart';

class Physics1Page extends StatefulWidget {
  @override
  Physics1PageState createState() => Physics1PageState();
}

class Physics1PageState extends State<Physics1Page> {
  double time = 0, finalv = 0, initialv = 0, displace = 0, answer = 0;
  String units = "";

  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();
  final TextEditingController t3 = new TextEditingController();
  final TextEditingController t4 = new TextEditingController();

  void findD() {
    setState(() {
      time = double.parse(t2.text);
      initialv = double.parse(t3.text);
      finalv = double.parse(t4.text);

      units = "metres";
      answer = ((initialv + finalv) / 2) * time;
    });
  }

  void findT() {
    setState(() {
      displace = double.parse(t1.text);
      initialv = double.parse(t3.text);
      finalv = double.parse(t4.text);

      units = "seconds";
      answer = (2 * displace) / (initialv + finalv);
    });
  }

  void findVi() {
    setState(() {
      displace = double.parse(t1.text);
      time = double.parse(t2.text);
      finalv = double.parse(t4.text);

      units = "metres per second";
      answer = ((2 * displace) / time) - finalv;
    });
  }

  void findVf() {
    setState(() {
      displace = double.parse(t1.text);
      time = double.parse(t2.text);
      initialv = double.parse(t3.text);

      units = "metres per second";
      answer = ((2 * displace) / time) - initialv;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 1.0,
          centerTitle: true,
          title: new Text("Equation #1"),
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
                        new InputDecoration(hintText: "Enter Final Velocity"),
                    controller: t4,
                  ),
                  Spacer(),
                  new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new RaisedButton(
                            color: Colors.blue,
                            child: new Text("Find Displacement!"),
                            onPressed: findD),
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
