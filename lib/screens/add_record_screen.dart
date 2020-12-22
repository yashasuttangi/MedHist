import 'package:flutter/material.dart';

class AddRecord extends StatefulWidget {
  @override
  _AddRecordState createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  Map<String, String> _patientData = {
    'id': '',
    'ailment': '',
    'prescription': '',
    'checked': '',
    'remarks': ''
  };

  bool _checked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Record"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
            height: 600,
            width: 400,
            padding: EdgeInsets.all(16),
            child: Form(
                // key: _formKey,
                child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  //Patient ID
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Patient ID'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter patient ID';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _patientData['id'] = value;
                    },
                  ),
                  SizedBox(height: 15.0),
                  // Ailment
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Ailment / Illness'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter ailment';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _patientData['ailment'] = value;
                    },
                  ),
                  SizedBox(height: 15.0),
                  // Prescription
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Prescription',
                    ),
                    // contentPadding: EdgeInsets.all(20.0)),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Prescription';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _patientData['prescription'] = value;
                    },
                  ),

                  SizedBox(height: 15.0),
                  // Prescription
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Extra Remarks',
                    ),
                    // contentPadding: EdgeInsets.all(20.0)),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Remarks';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _patientData['remarks'] = value;
                    },
                  ),

                  RaisedButton(
                    child: Text('Submit'),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Colors.blue,
                    textColor: Colors.white,
                  )

                  // SizedBox(
                  //   height: 100,
                  //   width: 450,
                  //   child: Padding(
                  //     padding:
                  //         EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  //     child: Text(
                  //       "Prescribed Tests",
                  //       style: TextStyle(
                  //           fontSize: 15.0,
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.black),
                  //       textAlign: TextAlign.start,
                  //     ),
                  //   ),
                  // ),

                  // Row(children: <Widget>[
                  //   //   Checkbox(
                  //   //       // value: _checked,
                  //   //       onChanged: (bool value) {
                  //   //     // print(value);
                  //   //     setState(() {
                  //   //       _checked = value;
                  //   //     });
                  //   //   }),
                  //   //   Text("Blood Test")
                  // ]),
                ],
              ),
            ))));
  }
}
