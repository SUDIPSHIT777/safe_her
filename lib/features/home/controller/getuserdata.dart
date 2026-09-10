import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safe_her/model/usermodel.dart';

class UserService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<UserModel?> getUser(String uid) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('users')
          .doc(uid)
          .get();

      if (snapshot.exists && snapshot.data() != null) {
        return UserModel.fromMap(snapshot.data()!);
      }
      return null;
    } catch (e) {
      log('Error getting user: $e');
      return null;
    }
  }
}
