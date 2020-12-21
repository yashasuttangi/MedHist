import 'package:flutter/material.dart';

class RecentPatientLog extends StatefulWidget {
  @override
  _RecentPatientLogState createState() => _RecentPatientLogState();
}

class _RecentPatientLogState extends State<RecentPatientLog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recent Patient Log"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          color: Colors.blue[200],
        ));
  }
}
