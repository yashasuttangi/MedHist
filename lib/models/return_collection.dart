import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollectedData extends StatefulWidget {
  CollectedData({Key key}) : super(key: key);

  @override
  _CollectedDataState createState() => _CollectedDataState();
}

class _CollectedDataState extends State<CollectedData> {
  @override
  Widget build(BuildContext context) {
    var _field;

    return Scaffold(
        appBar: AppBar(title: Text("Your Records")),
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('add_record').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Text("no value");
              }
              return ListView(
                children: snapshot.data.docs.map((document) {
                  return Text(document[_field]);
                }).toList(),
              );
            }));
  }
}
