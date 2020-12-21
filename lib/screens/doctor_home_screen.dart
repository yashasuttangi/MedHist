import 'package:flutter/material.dart';
import 'package:Medhist/models/http_exception.dart';
import 'add_record_screen.dart';
import 'search_patient_screen.dart';
import 'chatbox_screen.dart';
import 'recent_patient_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("Dashboard"),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.blue[100],
        body: Center(
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/doctor_image.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(1.0), BlendMode.dstIn))),
                child: Column(children: <Widget>[
                  SizedBox(height: 20),
                  SizedBox(
                    height: 80,
                    width: 400,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Text(
                        "Hi Doctor,",
                        style: TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[500]),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 120,
                    width: 400,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Text(
                        "Welcome to your dashboard",
                        style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[500]),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(20.0),
                            child: SizedBox(
                                height: 100.0,
                                width: 150.0,
                                child: Container(
                                  ///////// NEED TO WORK ON SHADOW FOR THE BUTTON and ///
                                  decoration: BoxDecoration(
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.blue.withOpacity(0.1),
                                        blurRadius: 10,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: RaisedButton(
                                    onPressed: () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddRecord())),
                                    },
                                    color: Colors.white,
                                    child: Text("Add Record"),
                                    splashColor: Colors.blue[100],
                                  ),
                                ))),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: MaterialButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RecentPatientLog()))
                            },
                            height: 100.0,
                            minWidth: 150.0,
                            color: Colors.white,
                            child: Text("Recent Patient Log"),
                            splashColor: Colors.blue[100],
                          ),
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: MaterialButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchScreen()))
                            },
                            height: 100.0,
                            minWidth: 150.0,
                            color: Colors.white,
                            child: Text("Search Patient"),
                            splashColor: Colors.blue[100],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: MaterialButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatBox()))
                            },
                            height: 100.0,
                            minWidth: 150.0,
                            color: Colors.white,
                            child: Text("Chatbox"),
                            splashColor: Colors.blue[100],
                          ),
                        ),
                      ])
                ]))));
  }
}
