import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safe_her/features/auth/signup/controller/signupservice.dart';

class Signupcontroller extends ChangeNotifier {
  final SignupService signupService = SignupService();

  bool _signuploading = false;
  bool get signuploading => _signuploading;

  Future<User?> userSignup({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    _signuploading = true;
    notifyListeners();

    try {
      final user = await signupService.signup(
        name: name.trim(),
        email: email.trim(),
        phone: phone.trim(),
        password: password.trim(),
      );

      return user;
    } finally {
      _signuploading = false;
      notifyListeners();
    }
  }
}
