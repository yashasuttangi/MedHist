import 'package:Medhist/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:Medhist/models/http_exception.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          actions: <Widget>[
            FlatButton(
              child: Row(
                children: <Widget>[Text('Logout'), Icon(Icons.person_add)],
              ),
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(LoginScreen.routeName);
              },
            )
          ],
        ),
        backgroundColor: Colors.blue[100],
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/doctor_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(children: <Widget>[
              SizedBox(height: 20),
              SizedBox(
                height: 80,
                width: 400,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    "Hi Doctor,",
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[400]),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              // Text(
              //   "Hi Doctor",
              //   style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              //   textAlign: TextAlign.start,
              // ),
              // Text(
              //   "Welcome to your dashboard",
              //   style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              //   textAlign: TextAlign.left,
              // ),

              SizedBox(
                height: 150,
                width: 400,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    "Welcome to your dashboard",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[400]),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(20.0),
                        child: SizedBox(
                            height: 100.0,
                            width: 150.0,
                            child: Container(
                              ///////// NEED TO WORK ON SHADOW FOR THE BUTTON and /// CONVERT ALL THE BUTTONS TO RAISED BUTTON.
                              decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Image.asset('images/add_record.jpg'),
                            ))),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: SizedBox(
                          height: 100.0,
                          width: 150.0,
                          child: Container(
                            ///////// NEED TO WORK ON SHADOW FOR THE BUTTON and /// CONVERT ALL THE BUTTONS TO RAISED BUTTON.
                            decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Image.asset('images/recent_record.jpg'),
                          )),
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: SizedBox(
                          height: 100.0,
                          width: 150.0,
                          child: Container(
                            ///////// NEED TO WORK ON SHADOW FOR THE BUTTON and /// CONVERT ALL THE BUTTONS TO RAISED BUTTON.
                            decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Image.asset('images/search_patients.jpg'),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: SizedBox(
                          height: 100.0,
                          width: 150.0,
                          child: Container(
                            ///////// NEED TO WORK ON SHADOW FOR THE BUTTON and /// CONVERT ALL THE BUTTONS TO RAISED BUTTON.
                            decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Image.asset('images/doc_chat.jpg'),
                          )),
                    ),
                  ])
            ])));
  }
}

// Version 3
// class HomeScreen extends StatelessWidget {
//   static const routeName = '/home';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//           child: Column(
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: new MaterialButton(
//                     height: 100.0,
//                     minWidth: 150.0,
//                     color: Theme.of(context).primaryColor,
//                     textColor: Colors.white,
//                     child: new Text("Profile"),
//                     onPressed: () {},
//                     // Navigator.push(
//                     // context,
//                     // MaterialPageRoute(builder: (context) => Profile()),
//                     // )
//                     // },
//                     splashColor: Colors.redAccent,
//                   )),
//               Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: new MaterialButton(
//                     height: 100.0,
//                     minWidth: 150.0,
//                     color: Theme.of(context).primaryColor,
//                     textColor: Colors.white,
//                     child: new Text("Menu"),
//                     onPressed: () => {
//                       // Navigator.push(
//                       // context,
//                       // MaterialPageRoute(builder: (context) => Menu()),
//                       // )
//                     },
//                     splashColor: Colors.redAccent,
//                   )),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: new MaterialButton(
//                     height: 100.0,
//                     minWidth: 150.0,
//                     color: Theme.of(context).primaryColor,
//                     textColor: Colors.white,
//                     child: new Text("Settings"),
//                     onPressed: () => {
//                       // Navigator.push(
//                       // context,
//                       // MaterialPageRoute(builder: (context) => Settings()),
//                       // )
//                     },
//                     splashColor: Colors.redAccent,
//                   )),
//               Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: new MaterialButton(
//                     height: 100.0,
//                     minWidth: 150.0,
//                     color: Theme.of(context).primaryColor,
//                     textColor: Colors.white,
//                     child: new Text("About"),
//                     onPressed: () => {
//                       // Navigator.push(
//                       // context,
//                       // MaterialPageRoute(builder: (context) => About()),
//                       // )
//                     },
//                     splashColor: Colors.redAccent,
//                   )),
//             ],
//           ),
//         ],
//       )),
//     );
//   }
// }

//             child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Icon(
//                     Icons.menu,
//                     color: Colors.white,
//                     size: 52.0,
//                   ),
//                   // Image.asset(
//                   //   "assets/image.png",
//                   //   width: 52.0,
//                   // )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(18.0),
//               child: Text(
//                 "Hi Doctor, \nWelcome to your Dashboard",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 28.0,
//                     fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.start,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Center(
//                 child: Wrap(
//                   spacing: 20,
//                   runSpacing: 20.0,
//                   children: <Widget>[
//                     SizedBox(
//                       width: 160.0,
//                       height: 160.0,
//                       child: Card(
//                         color: Color.fromARGB(255, 21, 21, 21),
//                         elevation: 2.0,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0)),
//                         child: Center(
//                             child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             children: <Widget>[
//                               // Image.asset(
//                               //   "assets/todo.png",
//                               //   width: 64.0,
//                               // ),
//                               SizedBox(
//                                 height: 10.0,
//                               ),
//                               Text(
//                                 "Todo List",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20.0),
//                               ),
//                               SizedBox(
//                                 height: 5.0,
//                               ),
//                               Text(
//                                 "2 Items",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w100),
//                               )
//                             ],
//                           ),
//                         )),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 160.0,
//                       height: 160.0,
//                       child: Card(
//                         color: Color.fromARGB(255, 21, 21, 21),
//                         elevation: 2.0,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0)),
//                         child: Center(
//                             child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             children: <Widget>[
//                               // Image.asset(
//                               //   "assets/note.png",
//                               //   width: 64.0,
//                               // ),
//                               SizedBox(
//                                 height: 10.0,
//                               ),
//                               Text(
//                                 "Notes",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20.0),
//                               ),
//                               SizedBox(
//                                 height: 5.0,
//                               ),
//                               Text(
//                                 "12 Items",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w100),
//                               )
//                             ],
//                           ),
//                         )),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 160.0,
//                       height: 160.0,
//                       child: Card(
//                         color: Color.fromARGB(255, 21, 21, 21),
//                         elevation: 2.0,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0)),
//                         child: Center(
//                             child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             children: <Widget>[
//                               // Image.asset(
//                               //   "assets/calendar.png",
//                               //   width: 64.0,
//                               // ),
//                               SizedBox(
//                                 height: 10.0,
//                               ),
//                               Text(
//                                 "Agenda",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20.0),
//                               ),
//                               SizedBox(
//                                 height: 5.0,
//                               ),
//                               Text(
//                                 "4 Items",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w100),
//                               )
//                             ],
//                           ),
//                         )),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 160.0,
//                       height: 160.0,
//                       child: Card(
//                         color: Color.fromARGB(255, 21, 21, 21),
//                         elevation: 2.0,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0)),
//                         child: Center(
//                             child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             children: <Widget>[
//                               // Image.asset("",width: 64.0,),
//                               SizedBox(
//                                 height: 10.0,
//                               ),
//                               Text(
//                                 "Settings",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20.0),
//                               ),
//                               SizedBox(
//                                 height: 5.0,
//                               ),
//                               Text(
//                                 "6 Items",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w100),
//                               )
//                             ],
//                           ),
//                         )),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         )));
//   }
// }

// Version 1
//         backgroundColor: Colors.cyan,
//         body: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       FlatButton(
//                         padding:
//                             EdgeInsets.symmetric(vertical: 3, horizontal: 5),
//                         onPressed: () {},
//                         child: Icon(
//                           Icons.menu,
//                           color: Colors.white,
//                           size: 40.0,
//                         ),
//                       )
//                       // Icon(Icons.menu, color: Colors.white, size: 40.0),
//                     ],
//                   )),
//               Padding(
//                 padding: const EdgeInsets.all(18.0),
//                 child: Text(
//                   "Hi Patient, Welcome to your Dashboard",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 28.0,
//                       fontWeight: FontWeight.bold),
//                   textAlign: TextAlign.start,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Center(
//                     child: Wrap(
//                   spacing: 20,
//                   runSpacing: 20.0,
//                   children: <Widget>[
//                     SizedBox(
//                       width: 160.0,
//                       height: 160.0,
//                       child: Card(
//                           color: Colors.blue[100],
//                           elevation: 2.0,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8.0)),
//                           child: Center(
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 children: <Widget>[
//                                   // Image.asset("", width: 64.0),
//                                   SizedBox(
//                                     height: 10.0,
//                                   ),
//                                   Text(
//                                     "Add Record",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 20.0),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           )),
//                     ),

//                     // Section - 2
//                     SizedBox(
//                         width: 160.0,
//                         height: 160.0,
//                         child: Card(
//                             color: Colors.white,
//                             elevation: 2.0,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8.0)),
//                             child: Center(
//                               child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Column(
//                                     children: <Widget>[
//                                       // Image.asset("", width: 64.0),
//                                       SizedBox(
//                                         height: 10.0,
//                                       ),
//                                       Text(
//                                         "Search Patient",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 20.0),
//                                       ),
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//                                       Text(
//                                         "Patient Records",
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.w100,
//                                         ),
//                                       )
//                                     ],
//                                   )),
//                             ))),

//                     // Section - 3
//                     SizedBox(
//                         width: 160.0,
//                         height: 160.0,
//                         child: Card(
//                             color: Colors.white,
//                             elevation: 2.0,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8.0)),
//                             child: Center(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   children: <Widget>[
//                                     // Image.asset("", width:64.0)
//                                     SizedBox(
//                                       height: 10.0,
//                                     ),
//                                     Text(
//                                       "Chatbox",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 20.0),
//                                     ),
//                                     SizedBox(height: 5.0),
//                                     Text(
//                                       "Attend Patient Queries",
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.w100,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ))),
//                     SizedBox(
//                         width: 160.0,
//                         height: 160.0,
//                         child: Card(
//                             color: Colors.white,
//                             elevation: 2.0,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8.0)),
//                             child: Center(
//                               child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Column(children: <Widget>[
//                                     // Image.asset("", width:64.0)
//                                     SizedBox(
//                                       height: 10.0,
//                                     ),
//                                     Text(
//                                       "Recent Patient Log",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 20.0),
//                                     ),
//                                     SizedBox(height: 5.0),
//                                     Text(
//                                       "View recently treated patients",
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.w100,
//                                       ),
//                                     )
//                                   ])),
//                             )))
//                   ],
//                 )),
//               )
//             ],
//           ),
//         )

//         //   appBar: AppBar(
//         //     title: Text('Home Screen'),
//         //   ),
//         //   body: Center(
//         //     child: Text(
//         //       'This is my home screen',
//         //       style: TextStyle(
//         //         fontWeight: FontWeight.bold,
//         //         fontSize: 20,
//         //       ),
//         //     ),
//         //   ),
//         // );
//         );
//   }
// }
