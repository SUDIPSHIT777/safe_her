import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safe_her/features/home/ui/emargencyaction.dart';
import 'package:safe_her/features/home/widget/card.dart';
import 'package:safe_her/features/home/widget/mydrawer.dart';
import 'package:safe_her/features/home/widget/saftycard.dart';
import 'package:safe_her/shared_widget/titlebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final screeenwidth = MediaQuery.sizeOf(context).width;
    final themecolor = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) {
            return IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              style: IconButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                overlayColor: Colors.transparent,
              ),
              icon: Image.asset(
                'assets/menu.png',
                width: 35,
                height: 35,
                color: themecolor.primary,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),

        centerTitle: true,

        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFFF3F78), Color(0xFF2D1A5A)],
          ).createShader(bounds),
          child: Text(
            'SafeHer',
            style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              letterSpacing: 2,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: themecolor.primary,
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: user?.photoURL?.isNotEmpty == true
                  ? Image.network(
                      user!.photoURL!,
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        );
                      },
                      // Show when network image fails
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.white,
                        );
                      },
                    )
                  : const Icon(Icons.person, size: 30, color: Colors.white),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      drawer:  Mydrawer(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'Hello, Warrior! 👋',
                    style: GoogleFonts.poppins(
                      fontSize: screeenwidth * 0.055,
                      color: themecolor.onSecondaryContainer,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                    ),
                    onPressed: () {},
                    label: Row(
                      children: [Text('i am safe'), Icon(Icons.shield)],
                    ),
                  ),
                ],
              ),
              Text(
                'You are strong, you are not alone.',
                style: GoogleFonts.poppins(
                  color: themecolor.onSurfaceVariant.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const EmergencyActions(),
              const SizedBox(height: 10),
              titlebar(title: "Emergency"),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: dashboardCard(
                        context,
                        color: themecolor.primary,
                        image: 'assets/location.png',
                        title: 'Share Location',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: dashboardCard(
                        context,
                        color: themecolor.secondary,
                        image: 'assets/camera.png',
                        title: 'Take Evidence',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: dashboardCard(
                        context,
                        color: themecolor.secondary.withValues(alpha: 0.8),
                        image: 'assets/group.png',
                        title: 'Emergency Contact',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              SafetyTipCard(),
              SizedBox(height: 10),
              titlebar(title: "Quick Access"),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: dashboardCard(
                        context,
                        color: themecolor.primary,
                        image: 'assets/balance.png',
                        title: 'Legal Shield',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: dashboardCard(
                        context,
                        color: themecolor.secondary,
                        image: 'assets/protection.png',
                        title: 'Report Incident',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: dashboardCard(
                        context,
                        color: themecolor.secondary,
                        image: 'assets/connection.png',
                        title: 'Safty Tools',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: dashboardCard(
                        context,
                        color: themecolor.primary,
                        image: 'assets/quality-of-life.png',
                        title: 'Find Help',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
