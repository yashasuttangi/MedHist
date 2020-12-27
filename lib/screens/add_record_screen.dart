import 'package:Medhist/models/authentication.dart';
import 'package:Medhist/screens/doctor_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AddRecord());
}

class AddRecord extends StatefulWidget {
  @override
  _AddRecordState createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  TextEditingController _phone_number = new TextEditingController();
  TextEditingController _date = new TextEditingController();
  TextEditingController _ailment = new TextEditingController();
  TextEditingController _prescription = new TextEditingController();
  TextEditingController _extraremarks = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Record"),
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
                    controller: _phone_number,
                    decoration: InputDecoration(
                        labelText: 'Phone number',
                        hintText: 'Enter phone number'),
                  ),
                  SizedBox(height: 15.0),
                  //Patient ID
                  TextFormField(
                    controller: _ailment,
                    decoration: InputDecoration(
                        labelText: 'Ailment', hintText: 'Enter ailment'),
                  ),
                  SizedBox(height: 15.0),
                  // Prescription
                  TextFormField(
                    controller: _prescription,
                    decoration: InputDecoration(
                        labelText: 'prescription',
                        hintText: 'enter prescription'),
                  ),
                  SizedBox(height: 15.0),
                  // Ailment
                  TextFormField(
                    controller: _extraremarks,
                    decoration: InputDecoration(
                        labelText: 'Extra remarks',
                        hintText: 'enter extra remarks'),
                  ),
                  SizedBox(height: 15.0),
                  //date
                  TextFormField(
                    controller: _date,
                    decoration: InputDecoration(
                        labelText: 'Date', hintText: 'dd-mm-yyyy'),
                  ),
                  RaisedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      Map<String, String> data = {
                        "date": _date.text,
                        "phone number": _phone_number.text,
                        "ailment": _ailment.text,
                        "prescription": _prescription.text,
                        "extraremarks": _extraremarks.text
                      };
                      print(data);
                      FirebaseFirestore.instance
                          .collection(_phone_number.text)
                          .doc(_date.text)
                          .set(data);
                      Navigator.of(context)
                          .pushReplacementNamed(DoctorHomeScreen.routeName);
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
