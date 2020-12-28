import 'package:Medhist/models/authentication.dart';
import 'package:Medhist/screens/doctor_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewRecord extends StatefulWidget {
  ViewRecord({Key key}) : super(key: key);

  @override
  _ViewRecordState createState() => _ViewRecordState();
}

class _ViewRecordState extends State<ViewRecord> {
  set list(Iterable list) {}

  @override
  Widget build(BuildContext context) {
    Future<String> getDocs(String email, String date) async {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("user_info")
          .doc(email)
          .collection("medical_records")
          .get();
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        var a = querySnapshot.docs[i];
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection("user_info")
            .doc(email)
            .collection("medical_records")
            .doc(a.id)
            .get();
        print(documentSnapshot.data().values);
      }
    }
  }
}
