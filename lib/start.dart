import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      children: <Widget>[
        SizedBox(height: 150.0),
        Container(
          child: Image(
            image: AssetImage('images/Medhist_logo.jpg'),
          ),
        ),
        SizedBox(height: 80.0),
        RichText(
          text: TextSpan(
              text: "Welcome to ",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    text: "Med",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
                TextSpan(
                    text: "Hist",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green))
              ]),
        ),
        SizedBox(height: 25.0),
        Text('One Stop for all your Medical records.',
            style: TextStyle(color: Colors.black)),
        Text(
          'A single app for Doctors, Patients and Diagnostic Centres',
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                onPressed: () {},
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.blue),
            SizedBox(width: 20.0),
            RaisedButton(
                onPressed: () {},
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  "REGISTER",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.blue),
          ],
        )
      ],
    )));
  }
}
