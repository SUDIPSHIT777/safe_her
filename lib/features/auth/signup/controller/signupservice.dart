import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safe_her/model/usermodel.dart';

class SignupService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<User?> signup({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    final UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    final User? user = userCredential.user;
    if (user == null) return null;
    await user.updateDisplayName(name.trim());
    final userModel = UserModel(
      uid: user.uid,
      name: name.trim(),
      email: email.trim(),
      photoURL: 'null',
      phoneNumber: phone.trim(),
      createdAt: Timestamp.now(),
      updatedAt: Timestamp.now(),
    );

    await firestore.collection('users').doc(user.uid).set(userModel.toMap());
    return user;
  }
}
