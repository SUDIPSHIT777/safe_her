import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:safe_her/model/usermodel.dart';

class Googlelogin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String serverClientId =
      '262898799859-odaq86brkd9q0cj0adc170vel6j1kdf3.apps.googleusercontent.com';
  bool _isInitialized = false;
  Future<void> _initializeGoogleSignIn() async {
    if (_isInitialized) return;
    await GoogleSignIn.instance.initialize(serverClientId: serverClientId);
    _isInitialized = true;
  }

  Future<User?> googleLogin() async {
    try {
      await _initializeGoogleSignIn();

      // ====== Open google Login ======
      final GoogleSignInAccount googleuser = await GoogleSignIn.instance
          .authenticate();
      // ====== Get Google Authentication ======
      final GoogleSignInAuthentication googleauth = googleuser.authentication;
      // ===== Create Firebase credential ======
      final credentaial = GoogleAuthProvider.credential(
        idToken: googleauth.idToken,
      );
      //====== Login to Firebase ======
      final UserCredential userCredential = await _auth.signInWithCredential(
        credentaial,
      );
      final User? user = userCredential.user;
      if (user != null) {
        await _saveUsertoFirebase(user);
      }
      return user;
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return null;
      }
      rethrow;
    } on FirebaseAuthException catch (e) {
      log('Firebase Error Code: ${e.code}');
      log('Firebase Error Message: ${e.message}');
      rethrow;
    }
  }

  // =============== Save The User Info In Firebase ==============
  Future<void> _saveUsertoFirebase(User user) async {
    final userdoc = _firestore.collection('users').doc(user.uid);
    final docsnapshot = await userdoc.get();
    if (!docsnapshot.exists) {
      final usermodel = UserModel(
        uid: user.uid,
        name: user.displayName ?? "",
        email: user.email ?? '',
        phoneNumber: user.phoneNumber,
        createdAt: Timestamp.now(),
        updatedAt: Timestamp.now(),
      );
      return userdoc.set(usermodel.toMap());
    } else {
      await userdoc.update({
        'name': user.displayName,
        'email': user.email,
        'photoUrl': user.photoURL,
        'updatedAt': Timestamp.now(),
      });
    }
  }

  User? get currentUser => _auth.currentUser;

  Future<void> signOut() async {
    await _auth.signOut();
  }

  // // ======= Phone Numbeer =======
  // Future<void> updatePhoneNumber(String phoneNumber) async {
  //   final user = _auth.currentUser;

  //   if (user == null) {
  //     throw Exception('User not logged in');
  //   }
  //   await _firestore.collection('users').doc(user.uid).update({
  //     'phoneNumber': phoneNumber,
  //     'isProfileComplete': true,
  //     'updatedAt': Timestamp.now(),
  //   });
  // }
}
