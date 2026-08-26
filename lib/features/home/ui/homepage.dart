import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safe_her/features/auth/storelogin.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      ),
    );
  }
}
