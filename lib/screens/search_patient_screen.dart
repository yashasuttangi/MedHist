import 'package:Medhist/models/authentication.dart';
import 'package:Medhist/screens/doctor_home_screen.dart';
import 'package:Medhist/screens/view_record.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _date = new TextEditingController();
  Map<String, String> _authData = {
    'date': '',
    'ailment': '',
    'prescription': '',
    'extraremarks': ''
  };
  @override
  Widget build(BuildContext context) {
    void _showErrorDialog(String msg) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('An Error Occured'),
                content: Text(msg),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Okay'),
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                  )
                ],
              ));
    }

    Future getDocs(String email, String date) async {
      try {
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection("user_info")
            .doc(email)
            .collection("medical_records")
            .doc(date)
            .get();
        return documentSnapshot.data().values;
      } catch (e) {
        var errorMessage = 'Invalid search input try again...';
        _showErrorDialog(errorMessage);
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Search Patient Records"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
            height: 600,
            width: 400,
            padding: EdgeInsets.all(16),
            child: Form(
                // key: _formKey,
                child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                        labelText: 'Email', hintText: 'Enter Email'),
                  ),
                  SizedBox(height: 15.0),

                  //date
                  // TextFormField(
                  //   controller: _date,
                  //   decoration: InputDecoration(
                  //       labelText: 'Date', hintText: 'dd-mm-yyyy'),
                  // ),
                  RaisedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      // getDocs(_email.text, _date.text).then((data) {
                      //   print(data);
                      // });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewRecord()));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Colors.blue,
                    textColor: Colors.white,
                  )

                  // SizedBox(
                  //   height: 100,
                  //   width: 450,
                  //   child: Padding(
                  //     padding:
                  //         EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  //     child: Text(
                  //       "Prescribed Tests",
                  //       style: TextStyle(
                  //           fontSize: 15.0,
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.black),
                  //       textAlign: TextAlign.start,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ))));
  }
}
