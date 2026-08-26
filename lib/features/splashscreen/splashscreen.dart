import 'package:flutter/material.dart';
import 'package:safe_her/features/auth/storelogin.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    StoreloginInfo.isloggin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
