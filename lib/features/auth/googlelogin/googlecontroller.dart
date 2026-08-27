import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:safe_her/features/auth/googlelogin/googlelogin.dart';

class Googlecontroller extends ChangeNotifier {
  final Googlelogin googlelogin = Googlelogin();
  bool _isloading = false;
  bool get isloading => _isloading;
  Future<User?> googleSignin() async {
    _isloading = true;
    notifyListeners();
    try {
      final user = await googlelogin.googleLogin();
      return user;
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return null; // User cancelled login
      }
      rethrow;
    } finally {
      _isloading = false;
      notifyListeners();
    }
  }

  bool _visibility = false;
  bool get visibility => _visibility;
  void switchOnOff() {
    _visibility = !_visibility;
    notifyListeners();
  }
}
