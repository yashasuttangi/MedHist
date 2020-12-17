import 'package:Medhist/HomePage.dart';
// import 'package:Medhist/login.dart';
import 'package:flutter/material.dart';
// import 'package:Medhist/Animation/FadeAnimation.dart';
// import 'start.dart';
import 'homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
