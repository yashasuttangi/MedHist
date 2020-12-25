import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadingData(
    String name, String phone_number, String hospital, String role) async {
  await FirebaseFirestore.instance.collection('products').add({
    'name': name,
    'phone_number': phone_number,
    'hospital': hospital,
    'role': role,
  });
}
