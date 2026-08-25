import 'package:go_router/go_router.dart';
import 'package:safe_her/features/auth/login/ui/loginpage.dart';
import 'package:safe_her/features/auth/signup/ui/signuppage.dart';

class Routes {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => Loginpage()),
      GoRoute(path: '/signup', builder: (context, state) => Signuppage()),
    ],
  );
}
