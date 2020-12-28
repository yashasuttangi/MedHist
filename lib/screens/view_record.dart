import 'package:Medhist/models/authentication.dart';
import 'package:Medhist/screens/doctor_home_screen.dart';
import 'package:Medhist/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Medhist/screens/login_screen.dart';

class ViewRecord extends StatefulWidget {
  ViewRecord({Key key}) : super(key: key);

  @override
  _ViewRecordState createState() => _ViewRecordState();
}

class _ViewRecordState extends State<ViewRecord> {
  set list(Iterable list) {}

  String _email1 = "patient@gmail.com";
  String _email2 = "patient1@gmail.com";

  List<dynamic> myList = List<dynamic>();

  Future<void> getDocs(String email) async {
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

      myList.add(documentSnapshot.data().values);
    }

    print(myList);
    // return myList;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("user_info")
            .doc(_email1)
            .collection("medical_records")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading data.. Please wait...");
          }
          return Scaffold(
              appBar: AppBar(title: Text("View History")),
              body: Container(
                alignment: Alignment.center,
                child: Column(children: <Widget>[
                  SizedBox(height: 10),
                  Container(
                      width: 300,
                      // alignment: Alignment.center,
                      // padding: EdgeInsets.symmetric(),
                      child: Card(
                          child: Column(children: [
                        Row(children: [
                          Text("Ailment :"),
                          SizedBox(width: 10),
                          Text(snapshot.data.documents[0]['ailment'],
                              style: TextStyle(fontSize: 20)),
                        ]),
                        Row(
                          children: [
                            Text("Prescription :"),
                            SizedBox(width: 10),
                            Text(snapshot.data.documents[0]['prescription'],
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Remarks :"),
                            SizedBox(width: 10),
                            Text(snapshot.data.documents[0]['extraremarks'],
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Date :"),
                            SizedBox(width: 10),
                            Text(snapshot.data.documents[0]['date'],
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ]))),

                  SizedBox(height: 15),

                  Container(
                      width: 300,
                      child: Card(
                          child: Column(children: [
                        Row(children: [
                          Text("Ailment :"),
                          SizedBox(width: 10),
                          Text(snapshot.data.documents[1]['ailment'],
                              style: TextStyle(fontSize: 20)),
                        ]),
                        Row(
                          children: [
                            Text("Prescription :"),
                            SizedBox(width: 10),
                            Text(snapshot.data.documents[1]['prescription'],
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Remarks :"),
                            SizedBox(width: 10),
                            Text(snapshot.data.documents[1]['extraremarks'],
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Date :"),
                            SizedBox(width: 10),
                            Text(snapshot.data.documents[1]['date'],
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ]))),
                  // Container(
                  //     width: 250,
                  //     child: Card(
                  //         child: Column(
                  //       children: [
                  //         Text(snapshot.data.documents[1]['ailment'],
                  //             style: TextStyle(fontSize: 20)),
                  //         Text(snapshot.data.documents[1]['prescription'],
                  //             style: TextStyle(fontSize: 15)),
                  //       ],
                  //     ))),
                ]),
              ));
        });

    // @override
    // Widget build(BuildContext context) {
    //   return Scaffold(
    //       appBar: AppBar(
    //         title: Text("View History"),
    //       ),
    //       body: Container(
    //           child: ListView.builder(
    //               itemCount: myList.length,
    //               itemBuilder: ((context, index) {
    //                 getDocs(_email);
    //                 return ListTile(
    //                   title: Text(myList[index].data['ailment'],
    //                       style: TextStyle(
    //                         color: Colors.black,
    //                         fontWeight: FontWeight.bold,
    //                       )),
    //                   subtitle: Text(myList[index].data['email'],
    //                       style: TextStyle(
    //                         color: Colors.grey,
    //                       )),
    //                 );
    //               })))
    //       // : Container(child: CircularProgressIndicator())
    //       );
  }
}
