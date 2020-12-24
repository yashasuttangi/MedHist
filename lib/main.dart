import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Medhist/screens/doctor_home_screen.dart';
import 'package:Medhist/screens/login_screen.dart';
import 'package:Medhist/screens/signup_screen.dart';
import 'package:Medhist/screens/search_patient_screen.dart';
import 'package:Medhist/screens/patient_home_screen.dart';
import 'package:Medhist/models/authentication.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Authentication(),
        )
      ],
      child: MaterialApp(
        title: 'Login App',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: LoginScreen(),
        routes: {
          SignupScreen.routeName: (ctx) => SignupScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
<<<<<<< HEAD
          DoctorHomeScreen.routeName: (ctx) => DoctorHomeScreen(),
=======
          // PatientHomeScreen.routeName: (ctx) => PatientHomeScreen(),
>>>>>>> 106388a59fcfdecb0d0a669180967a5c1b81402e
        },
      ),
    );
  }
}
