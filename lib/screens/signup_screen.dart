import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/authentication.dart';

import 'doctor_home_screen.dart';
import 'login_screen.dart';

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
      Category(3, 'Diagnostic Centre'),
    ];
  }
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _passwordController = new TextEditingController();

  Map<String, String> _authData = {'email': '', 'password': ''};

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
      Navigator.of(context).pushReplacementNamed(DoctorHomeScreen.routeName);
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
                          decoration: InputDecoration(labelText: 'Full Name'),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter your name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _authData['email'] = value;
                          },
                        ),

                        // PHONE NUMBER
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Phone Number'),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter phone number';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _authData['email'] = value;
                          },
                        ),

                        //EMAIL
                        TextFormField(
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
                          decoration:
                              InputDecoration(labelText: 'Hospital Name'),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter the hospital name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _authData['email'] = value;
                          },
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Category :   ",
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                  height: 20.0,
                                  child: DropdownButton(
                                    value: _selectedCategory,
                                    items: _dropdownMenuItems,
                                    onChanged: onChangedDropdownItem,
                                  )),
                            ]),

                        SizedBox(
                          height: 25,
                        ),
                        RaisedButton(
                          child: Text('Submit'),
                          onPressed: () {
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
