import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safe_her/shared_widget/coustombutton.dart';
import 'package:safe_her/features/auth/login/widget/textformfield.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    final themecolor = Theme.of(context).colorScheme;
    final screenwidth = MediaQuery.sizeOf(context).width;
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/loginimg.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: AutoSizeText(
                    "Welcome Back ,",
                    style: GoogleFonts.poppins(
                      fontSize: screenwidth * 0.06,
                      fontWeight: FontWeight.w500,
                      color: themecolor.onSurface,
                    ),
                  ),
                ),
                Center(
                  child: AutoSizeText(
                    "Brave Warrior! 💪",
                    style: GoogleFonts.poppins(
                      fontSize: screenwidth * 0.06,
                      fontWeight: FontWeight.w500,
                      color: themecolor.onSurface,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Center(
                  child: AutoSizeText(
                    'Login to continue your journey',
                    style: GoogleFonts.poppins(
                      color: themecolor.onSurfaceVariant,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Center(
                  child: AutoSizeText(
                    'towards safety and empowerment.',
                    style: GoogleFonts.poppins(
                      color: themecolor.onSurfaceVariant,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'Email or Phone Number',
                          style: GoogleFonts.poppins(
                            color: themecolor.onSurface,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        customTextField(
                          context,
                          controller: email,
                          hintText: "Enter email or phone number",
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          prefixIcon: Icons.person_3,
                          suffixIcon: null,
                        ),
                        SizedBox(height: 10),
                        AutoSizeText(
                          'Password',
                          style: GoogleFonts.poppins(
                            color: themecolor.onSurface,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        customTextField(
                          context,
                          controller: password,
                          hintText: "Enter password",
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          prefixIcon: Icons.lock,
                          suffixIcon: Icon(Icons.visibility_off),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Align(
                    alignment: AlignmentGeometry.bottomRight,
                    child: Text(
                      "Forget Password?",
                      style: GoogleFonts.poppins(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                customGradientButton(
                  context: context,
                  onPressed: () {},
                  text: "Login",
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1.2,
                        color: themecolor.onSurfaceVariant.withValues(
                          alpha: 0.3,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: AutoSizeText(
                        'or Continue with',
                        style: GoogleFonts.poppins(
                          color: themecolor.onSurfaceVariant.withValues(
                            alpha: 0.5,
                          ),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1.2,
                        color: themecolor.onSurfaceVariant.withValues(
                          alpha: 0.3,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                googleButton(context: context, onPressed: () {}),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      'don`t have an account? ',
                      style: GoogleFonts.poppins(
                        color: themecolor.onSurfaceVariant,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: AutoSizeText(
                        'Sign up',
                        style: GoogleFonts.poppins(
                          color: themecolor.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
