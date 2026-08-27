import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safe_her/features/auth/googlelogin/storelogin.dart';
import 'package:safe_her/features/splashscreen/splashwidget.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    StoreloginInfo.checkLoginStatus(context);
  }

  @override
  Widget build(BuildContext context) {
    final themecolor = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Center(
                    child: Image.asset(
                      'assets/splashlogo.png',
                      width: 120,
                      height: 120,
                    ),
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Color(0xFFFF3F78), Color(0xFF2D1A5A)],
                    ).createShader(bounds),
                    child: Text(
                      'SafeHer',
                      style: GoogleFonts.poppins(
                        fontSize: 50,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  AutoSizeText(
                    "Shield of Safety. Strength of Every Women",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: themecolor.onSurface,
                    ),
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    width: 200,
                    height: 20,
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: themecolor.primary.withValues(alpha: 0.5),
                          ),
                        ),
                        Image.asset(
                          'assets/shield.png',
                          height: 40,
                          width: 30,
                          color: themecolor.primary,
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: themecolor.primary.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      featureItem(
                        imagePath: 'assets/open-book.png',
                        subtitle: 'Know Your Right',
                        title: 'Educate',
                      ),
                      featureItem(
                        imagePath: 'assets/quality-of-life.png',
                        subtitle: 'Heal & be heard',
                        title: 'Recover',
                      ),
                      featureItem(
                        imagePath: 'assets/safe.png',
                        subtitle: 'Stay safe, always',
                        title: 'Protect',
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: 200,
                    height: 5,
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  SizedBox(height: 30),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/treeimg.png',
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),

                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AutoSizeText(
                            "You are not alone",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: themecolor.onSurface,
                            ),
                          ),
                          AutoSizeText(
                            "We are with you.",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: themecolor.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
