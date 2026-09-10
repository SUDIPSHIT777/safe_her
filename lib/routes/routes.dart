import 'package:go_router/go_router.dart';
import 'package:safe_her/features/auth/login/loginpage.dart';
import 'package:safe_her/features/auth/signup/signuppage.dart';
import 'package:safe_her/features/splashscreen/splashscreen.dart';
import 'package:safe_her/shared_widget/navigationbar.dart';

class Routes {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/', builder: (context, state) => Loginpage()),
      GoRoute(path: '/signup', builder: (context, state) => Signuppage()),
      GoRoute(path: '/splash', builder: (context, state) => Splashscreen()),
      GoRoute(
        path: '/home',
        builder: (context, state) => const Navigationbar(),
      ),
    ],
  );
}
