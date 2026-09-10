import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:safe_her/features/auth/googlelogin/googlelogin.dart';
import 'package:safe_her/features/auth/googlelogin/storelogin.dart';
import 'package:safe_her/features/home/controller/userprovider.dart';
import 'package:safe_her/shared_widget/coustombutton.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final Googlelogin googlelogin = Googlelogin();
    final authUser = FirebaseAuth.instance.currentUser;

    if (authUser == null) {
      return const Drawer(
        child: Center(
          child: Text(
            'User not logged in',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      );
    }

    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        final firestoreUser = userProvider.user;

        return Drawer(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Profile Image
                  Container(
                    width: 125,
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFFF9437A), Color(0xFFFF8A65)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 51,
                        backgroundColor: const Color(0xFFF9437A),
                        backgroundImage: authUser.photoURL != null
                            ? NetworkImage(authUser.photoURL!)
                            : null,
                        child: authUser.photoURL == null
                            ? const Icon(
                                Icons.person,
                                size: 60,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    firestoreUser?.name ?? authUser.displayName ?? 'User Name',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),
                  Text(
                    firestoreUser?.email ??
                        authUser.email ??
                        'No email available',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),

                  const SizedBox(height: 35),
                  _profileItem(
                    context,
                    icon: Icons.person_outline,
                    title: 'Name',
                    value:
                        firestoreUser?.name ??
                        authUser.displayName ??
                        'Not available',
                  ),
                  const Divider(),

                  _profileItem(
                    context,
                    icon: Icons.email_outlined,
                    title: 'Email',
                    value:
                        firestoreUser?.email ??
                        authUser.email ??
                        'Not available',
                  ),

                  const Divider(),
                  _profileItem(
                    context,
                    icon: Icons.phone_outlined,
                    title: 'Phone Number',
                    value: firestoreUser?.phoneNumber?.isNotEmpty == true
                        ? firestoreUser!.phoneNumber!
                        : 'No number found',
                  ),

                  const Spacer(),
                  customGradientButton(
                    context: context,
                    onPressed: () async {
                      await googlelogin.signOut();
                      userProvider.clearUser();
                      await StoreloginInfo.logout();
                      if (context.mounted) {
                        context.go('/');
                      }
                    },
                    text: 'Logout',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _profileItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
  }) {
    final themecolor = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFF9437A), size: 25),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),

                const SizedBox(height: 4),

                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: themecolor.inverseSurface,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
