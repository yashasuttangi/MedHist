import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/authentication.dart';
import 'patient_home_screen.dart';
import 'doctor_home_screen.dart';
import 'login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SignupScreen());
}

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class Category {
  int id;
  String cat;
  Category(this.id, this.cat);

  static List<Category> getCategories() {
    return <Category>[
      Category(1, 'Doctor'),
      Category(2, 'Patient'),
    ];
  }
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone_number = new TextEditingController();
  TextEditingController _hospital = new TextEditingController();
  TextEditingController _role = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _email = new TextEditingController();

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  List<Category> _categories = Category.getCategories();
  List<DropdownMenuItem<Category>> _dropdownMenuItems;
  Category _selectedCategory;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_categories);
    _selectedCategory = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Category>> buildDropdownMenuItems(List categories) {
    List<DropdownMenuItem<Category>> items = List();
    for (Category category in categories) {
      items.add(DropdownMenuItem(value: category, child: Text(category.cat)));
    }
    return items;
  }

  onChangedDropdownItem(Category selectedCategory) {
    setState(() {
      _selectedCategory = selectedCategory;
    });
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
          .signUp(_authData['email'], _authData['password']);

      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    } catch (error) {
      var errorMessage = 'Authentication Failed. Please try again later.';
      _showErrorDialog(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[Text('Login'), Icon(Icons.person)],
            ),
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.blueAccent,
              Colors.blue,
            ])),
          ),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 550,
                width: 370,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        // NAME
                        TextFormField(
                          controller: _name,
                          decoration: InputDecoration(
                              labelText: 'Full name',
                              hintText: 'Enter your name'),
                        ),

                        // PHONE NUMBER
                        TextFormField(
                          controller: _phone_number,
                          decoration: InputDecoration(
                              labelText: 'Phone number',
                              hintText: 'Enter your Phone number'),
                        ),
                        //EMAIL
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
                          },
                        ),

                        //PASSWORD
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          controller: _passwordController,
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

                        //CONFIRM PASSWORD
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Confirm Password'),
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty ||
                                value != _passwordController.text) {
                              return 'invalid password';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),

                        // HOSPITAL NAME
                        TextFormField(
                          controller: _hospital,
                          decoration: InputDecoration(
                              labelText: 'Hospital name',
                              hintText: 'Enter Hospital name'),
                        ),

                        TextFormField(
                          controller: _role,
                          decoration: InputDecoration(
                              labelText: 'Enter your role',
                              hintText: 'doctor/patient'),
                        ),

                        SizedBox(
                          height: 25,
                        ),
                        RaisedButton(
                          child: Text('Submit'),
                          onPressed: () {
                            Map<String, String> data = {
                              "email": _email.text,
                              "name": _name.text,
                              "phone_number": _phone_number.text,
                              "hospital name": _hospital.text,
                              "role": _role.text
                            };
                            FirebaseFirestore.instance
                                .collection("user_info")
                                .doc(_email.text)
                                .set(data);
                            _submit();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.blue,
                          textColor: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
