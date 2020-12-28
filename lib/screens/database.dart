import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getUserbyUsername(String username) async {
    return await FirebaseFirestore.instance
        .collection("user_info")
        .where("name", isEqualTo: username)
        .get();
  }
}
