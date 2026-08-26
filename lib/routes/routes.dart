import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safe_her/features/auth/login/ui/loginpage.dart';
import 'package:safe_her/features/auth/signup/ui/signuppage.dart';
import 'package:safe_her/features/home/ui/homepage.dart';
import 'package:safe_her/features/splashscreen/splashscreen.dart';

class Routes {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/', builder: (context, state) => Loginpage()),
      GoRoute(path: '/signup', builder: (context, state) => Signuppage()),
      GoRoute(path: '/splash', builder: (context, state) => Splashscreen()),
      GoRoute(
        path: '/home',
        
      ),
    ],
  );
}
