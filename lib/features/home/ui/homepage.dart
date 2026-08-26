import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            // StoreloginInfo.logout();
            if (!context.mounted) return;
            context.go('/');
          },
          child: Text("Hello"),
        ),
      ),
    );
  }
}
