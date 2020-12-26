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
    // StreamBuilder(
    //   stream:
    //       FirebaseFirestore.instance.collection("_phone_number").snapshots(),
    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
    //     if (snapshot.hasData) {
    //       return new ListView.builder(
    //           shrinkWrap: true,
    //           itemCount: snapshot.data.documents.length,
    //           padding: const EdgeInsets.only(top: 5.0),
    //           itemBuilder: (context, index) {
    //             DocumentSnapshot ds = snapshot.data.documents[index];
    //             return new Row(
    //               textDirection: TextDirection.ltr,
    //               children: <Widget>[
    //                 Expanded(child: Text(ds["date"])),
    //                 Expanded(child: Text(ds["ailment"])),
    //                 Expanded(child: Text(ds["prescription"])),
    //                 Expanded(child: Text(ds["extraremarks"].toString())),
    //               ],
    //             );
    //           });
    //     }
    //   },
    // );
    Future getDocs() async {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection(_phone_number.text).get();
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        var a = querySnapshot.docs[i];
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection(_phone_number.text)
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
                        getDocs();
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
