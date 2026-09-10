import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safe_her/features/home/controller/getuserdata.dart';
import 'package:safe_her/model/usermodel.dart';

class UserProvider extends ChangeNotifier {
  final UserService _userService = UserService();

  UserModel? _user;
  UserModel? get user => _user;

  Future<void> loadUserData() async {
    final authUser = FirebaseAuth.instance.currentUser;

    if (authUser == null) {
      _user = null;
      notifyListeners();
      return;
    }

    try {
      _user = await _userService.getUser(authUser.uid);
      notifyListeners();
    } catch (e) {
      log(name: "UserProvider", 'User loading error: $e');
    }
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}
