import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Loginservice {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> loginService({
    required String emailOrPhone,
    required String password,
  }) async {
    try {
      String email = emailOrPhone.trim();
      final phoneRegex = RegExp(r'^[6-9]\d{9}$');
      if (phoneRegex.hasMatch(email)) {
        final query = await _firestore
            .collection('users')
            .where('phoneNumber', isEqualTo: email)
            .limit(1)
            .get();
        if (query.docs.isEmpty) {
          throw Exception('No account found with this phone number');
        }
        final data = query.docs.first.data();
        email = data['email'] as String;
      }
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(loginerror(e.code));
    } catch (e) {
      throw Exception(e.toString().replaceFirst('Exception: ', ''));
    }
  }

  String loginerror(String code) {
    switch (code) {
      case 'invalid-credential':
        return 'Invalid email or password';

      case 'user-not-found':
        return 'No account found';

      case 'wrong-password':
        return 'Incorrect password';

      case 'invalid-email':
        return 'Invalid email address';

      case 'user-disabled':
        return 'This account has been disabled';

      case 'too-many-requests':
        return 'Too many login attempts. Please try again later';

      case 'network-request-failed':
        return 'Check your internet connection';

      case 'operation-not-allowed':
        return 'Email/password login is not enabled in Firebase';

      default:
        return 'Firebase error: $code';
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }
}
