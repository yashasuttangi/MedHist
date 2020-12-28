import 'package:flutter/material.dart';
import 'package:Medhist/models/http_exception.dart';
import 'package:Medhist/screens/login_screen.dart';
import 'add_record_screen.dart';
import 'search_patient_screen.dart';
import 'chatbox_screen.dart';
import 'recent_patient_screen.dart';
import 'package:Medhist/screens/view_record.dart';

class PatientHomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          actions: <Widget>[
            FlatButton(
              child: Row(
                children: <Widget>[Text('Logout'), Icon(Icons.person_add)],
              ),
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(LoginScreen.routeName);
              },
            )
          ],
        ),
        backgroundColor: Colors.blue[100],
        body: Center(
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/patient_background.jpg'),
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
                        "Hi Patient,",
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
                  SizedBox(height: 160),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(20.0),
                            child: SizedBox(
                                height: 100.0,
                                width: 150.0,
                                child: IconButton(
                                  icon: Image.asset('images/view_records.jpg'),
                                  iconSize: 100,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewRecord()));
                                  },
                                ))),
                        Padding(
                            padding: EdgeInsets.all(20.0),
                            child: SizedBox(
                                height: 100.0,
                                width: 150.0,
                                child: IconButton(
                                  icon: Image.asset('images/doc_chat.jpg'),
                                  iconSize: 100,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ChatBox()));
                                  },
                                ))),
                      ])
                ]))));
  }
}
