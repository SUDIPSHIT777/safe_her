import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safe_her/features/auth/googlelogin/storelogin.dart';
import 'package:safe_her/shared_widget/snackbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (user != null) {
        showCustomSnackBar(
          context,
          icon: Icons.check_circle_outline_rounded,
          message: 'Welcome Warrior, ${user!.displayName ?? 'User'}!',
          color: Colors.green,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            StoreloginInfo.logout();
            if (!context.mounted) return;
            context.go('/');
          },
          child: Text("Hello"),
        ),
        actions: [
          CircleAvatar(
            backgroundImage: user?.photoURL?.isNotEmpty == true
                ? NetworkImage(user!.photoURL!)
                : null,
          ),
        ],
      ),
    );
  }
}
