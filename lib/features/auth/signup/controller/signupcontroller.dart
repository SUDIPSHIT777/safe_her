import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safe_her/features/auth/googlelogin/storelogin.dart';
import 'package:safe_her/features/auth/signup/controller/signupservice.dart';

class Signupcontroller extends ChangeNotifier {
  final SignupService signupService = SignupService();

  bool _signuploading = false;
  bool get signuploading => _signuploading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> userSignup({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    _signuploading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final User? user = await signupService.signup(
        name: name.trim(),
        email: email.trim(),
        phone: phone.trim(),
        password: password.trim(),
      );

      if (user == null) {
        _errorMessage = 'Unable to create your account. Please try again.';
        return false;
      }
      await StoreloginInfo.setlogin();
      return true;
    } on FirebaseAuthException catch (e) {
      _errorMessage = _getFirebaseErrorMessage(e.code);
      return false;
    } catch (e) {
      log('Signup error: $e');
      _errorMessage = 'Something went wrong. Please try again.';
      return false;
    } finally {
      _signuploading = false;
      notifyListeners();
    }
  }

  String _getFirebaseErrorMessage(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'An account already exists with this email.';
      case 'invalid-email':
        return 'Please enter a valid email address.';
      case 'weak-password':
        return 'Your password is too weak. Please use a stronger password.';
      case 'network-request-failed':
        return 'Please check your internet connection and try again.';
      default:
        return 'Unable to create your account. Please try again.';
    }
  }
}
