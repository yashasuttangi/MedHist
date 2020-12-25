import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Medhist/screens/doctor_home_screen.dart';
import 'package:Medhist/screens/login_screen.dart';
import 'package:Medhist/screens/signup_screen.dart';
import 'package:Medhist/screens/search_patient_screen.dart';
import 'package:Medhist/screens/patient_home_screen.dart';
import 'package:Medhist/models/authentication.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
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
          PatientHomeScreen.routeName: (ctx) => PatientHomeScreen(),
          DoctorHomeScreen.routeName: (ctx) => DoctorHomeScreen(),
        },
      ),
    );
  }
}
