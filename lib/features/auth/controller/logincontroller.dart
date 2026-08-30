import 'package:flutter/material.dart';
import 'package:safe_her/features/auth/controller/loginservice.dart';

class LoginController extends ChangeNotifier {
  final Loginservice loginService = Loginservice();

  bool isLoading = false;
  String? errorMessage;

  Future<bool> login({
    required String emailOrPhone,
    required String password,
  }) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final user = await loginService.loginService(
        emailOrPhone: emailOrPhone,
        password: password,
      );

      return user != null;
    } catch (e) {
      errorMessage = e.toString().replaceFirst('Exception: ', '');
      return false;
    } finally {
      isLoading = false;
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
