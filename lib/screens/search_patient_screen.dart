import 'package:Medhist/models/authentication.dart';
import 'package:Medhist/screens/doctor_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _phone_number = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future<String> getDocs(phone_number) async {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection(phone_number).get();
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        var a = querySnapshot.docs[i];
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection(phone_number)
            .doc(a.id)
            .get();
        print(documentSnapshot.data().values);
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Search Patient Records"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _phone_number,
                        decoration: InputDecoration(
                            hintText: "Enter patient's phone number",
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.black26),
                            border: InputBorder.none),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        var phone_number = _phone_number;
                        getDocs(phone_number.text);
                      },
                    )
                    // Container(
                    //     padding: EdgeInsets.all(10),
                    //     child: RaisedButton(
                    //       padding: EdgeInsets.all(10),
                    //       child: (Image.asset("images/search_vector.png")),
                    //       onPressed: () {},
                    //     ))
                  ],
                ))
          ],
        )));
  }
}
