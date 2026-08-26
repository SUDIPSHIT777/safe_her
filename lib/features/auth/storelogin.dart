import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreloginInfo {
  static const String _loginKey = 'isLoggedIn';
  static Future<void> setlogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loginKey, true);
  }

  static Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loginKey) ?? false;
  }

  static Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_loginKey);
  }

  static Future<void> checkLoginStatus(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 4));
    final isloggdin = await isLoggedIn();
    if (!context.mounted) return;
    if (isloggdin) {
      context.go('/home');
    } else {
      context.go('/');
    }
  }
}
