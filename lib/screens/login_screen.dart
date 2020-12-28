import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'signup_screen.dart';
import 'doctor_home_screen.dart';
import 'patient_home_screen.dart';
import 'package:Medhist/main.dart';
import '../models/authentication.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _email = new TextEditingController();
  Map<String, String> _authData = {'email': '', 'password': '', 'role': ''};
  Future<String> getDocs(String email) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection("user_info")
        .doc(email)
        .get();
    return documentSnapshot['role'];
  }

  String getEmail() {
    return _authData['email'];
  }

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

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    try {
      await Provider.of<Authentication>(context, listen: false)
          .logIn(_authData['email'], _authData['password']);
      if (_authData['role'] == 'doctor') {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => DoctorHomeScreen()));
      }
      if (_authData['role'] == 'patient') {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => PatientHomeScreen()));
      }
    } catch (error) {
      var errorMessage = 'Authentication Failed. Please try again later.';
      _showErrorDialog(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[Text('Signup'), Icon(Icons.person_add)],
            ),
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(SignupScreen.routeName);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
              // padding: EdgeInsets.symmetric(horizontal: 400, vertical: 100),
              child: Center(
            child: Image.asset('images/Medhist_logo.jpg'),
          )),
          Container(
              color: Colors.white,
              // decoration: BoxDecoration(
              //     gradient: LinearGradient(colors: [
              //   Colors.white,
              //   Colors.blue[300],
              // ])),
              child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  height: 80,
                  width: 400,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Text(
                      "Welcome to MedHist",
                      style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[700]),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              )
              // child: Text("Welcome to MedHist", textAlign: TextAlign.top,),
              ),
          Container(
              // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              // decoration: BoxDecoration(
              //   boxShadow: [
              //     BoxShadow(
              //       color: Color.alphaBlend(Colors.blue, Colors.green),
              //       blurRadius: 10.0,
              //     ),
              //   ],
              // ),
              child: Expanded(
                  child: Container(
                      child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.blue[50],
            child: Container(
              height: 250,
              width: 350,
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      //email
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty || !value.contains('@')) {
                            return 'invalid email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _authData['email'] = value;
                          getDocs(value).then((role) {
                            _authData['role'] = role;
                          });
                        },
                      ),

                      //password
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty || value.length <= 5) {
                            return 'invalid password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _authData['password'] = value;
                        },
                      ),

                      SizedBox(
                        height: 50,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.cyan,
                                blurRadius: 50.0,
                              ),
                            ],
                          ),
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            child: Text('LogIn'),
                            onPressed: () {
                              getDocs(_email.text);

                              _submit();
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: Colors.blue,
                            textColor: Colors.white,
                          ))
                    ],
                  ),
                  // ),
                ),
              ),
            ),
          ))))
        ],
      ),
    );
  }
}
