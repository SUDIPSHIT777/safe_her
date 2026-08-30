import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:safe_her/features/auth/controller/validators.dart';
import 'package:safe_her/features/auth/googlelogin/googlecontroller.dart';
import 'package:safe_her/features/auth/controller/signupcontroller.dart';
import 'package:safe_her/features/auth/googlelogin/storelogin.dart';
import 'package:safe_her/shared_widget/coustombutton.dart';
import 'package:safe_her/shared_widget/snackbar.dart';
import 'package:safe_her/shared_widget/textformfield.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final themecolor = Theme.of(context).colorScheme;
    final screenwidth = MediaQuery.sizeOf(context).width;
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
                      'assets/signupimg.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: AutoSizeText(
                    "Create Your Account,",
                    style: GoogleFonts.poppins(
                      fontSize: screenwidth * 0.06,
                      fontWeight: FontWeight.w500,
                      color: themecolor.onSurface,
                    ),
                  ),
                ),
                Center(
                  child: AutoSizeText(
                    "Brave Warrior! 🌸",
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
                    'Join SafeHer and be a part of a',
                    style: GoogleFonts.poppins(
                      color: themecolor.onSurfaceVariant,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Center(
                  child: AutoSizeText(
                    'safer and stronger community.',
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
                          'Full Name',
                          style: GoogleFonts.poppins(
                            color: themecolor.onSurface,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        customTextField(
                          context,
                          validator: (v) => Validators.validateName(v),
                          controller: username,
                          hintText: "Enter Name",
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          prefixIcon: Icons.person_3,
                          suffixIcon: null,
                          autofillHints: const [AutofillHints.username],
                        ),
                        SizedBox(height: 10),
                        AutoSizeText(
                          'Email',
                          style: GoogleFonts.poppins(
                            color: themecolor.onSurface,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        customTextField(
                          context,
                          validator: (v) => Validators.validateEmail(v),
                          controller: email,
                          hintText: "Enter email",
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          prefixIcon: Icons.email,
                          suffixIcon: null,
                          autofillHints: const [AutofillHints.email],
                        ),
                        SizedBox(height: 10),
                        AutoSizeText(
                          'Phone No',
                          style: GoogleFonts.poppins(
                            color: themecolor.onSurface,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        customTextField(
                          context,
                          validator: (v) => Validators.validatePhone(v),
                          controller: phone,
                          hintText: "Enter phone number",
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          prefixIcon: Icons.call,
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
                        Consumer<Googlecontroller>(
                          builder: (context, toggle, child) {
                            return customTextField(
                              context,
                              validator: (value) =>
                                  Validators.validatePassword(value),
                              controller: password,
                              hintText: "Enter password",
                              keyboardType: TextInputType.text,
                              obscureText: !toggle.visibility,
                              prefixIcon: Icons.lock,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  toggle.switchOnOff();
                                },
                                icon: Icon(
                                  toggle.visibility
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            );
                          },
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
                Consumer<Signupcontroller>(
                  builder: (context, signupcontroller, child) {
                    return customGradientButton(
                      context: context,
                      text: "Sign Up",
                      isLoading: signupcontroller.signuploading,
                      onPressed: signupcontroller.signuploading
                          ? null
                          : () async {
                              if (!formKey.currentState!.validate()) return;

                              final success = await signupcontroller.userSignup(
                                name: username.text,
                                email: email.text,
                                phone: phone.text,
                                password: password.text,
                              );
                              if (!context.mounted) return;
                              if (success) {
                                context.go('/splash');
                                showCustomSnackBar(
                                  context,
                                  icon: Icons.location_searching_rounded,
                                  message: 'Login Successfully 👍!',
                                  color: Colors.green,
                                );
                              } else {
                                showCustomSnackBar(
                                  context,
                                  icon: Icons.error_outline_rounded,
                                  message: "${signupcontroller.errorMessage}",
                                  color: themecolor.error,
                                );
                              }
                            },
                    );
                  },
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
                const SizedBox(height: 5),
                Consumer<Googlecontroller>(
                  builder: (context, googlelogin, child) {
                    if (googlelogin.isloading) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 2,
                            color: themecolor.onSurfaceVariant.withValues(
                              alpha: 0.2,
                            ),
                          ),
                        ),
                        width: double.infinity,
                        height: 56,
                        child: Center(
                          child: SizedBox(
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator(strokeWidth: 3),
                          ),
                        ),
                      );
                    }
                    return googleButton(
                      context: context,
                      onPressed: () async {
                        final user = await googlelogin.googleSignin();

                        if (user == null) {
                          if (!context.mounted) return;
                          showCustomSnackBar(
                            context,
                            icon: Icons.error_outline_rounded,
                            message: 'Google login failed. Please try again.',
                            color: themecolor.error,
                          );
                          return;
                        }
                        await StoreloginInfo.setlogin();
                        if (!context.mounted) return;
                        showCustomSnackBar(
                          context,
                          icon: Icons.check_circle_outline_rounded,
                          message: 'Google login successful 👍!',
                          color: Colors.green,
                        );
                        await Future.delayed(
                          const Duration(milliseconds: 1200),
                        );
                        if (!context.mounted) return;
                        context.go('/splash');
                      },
                    );
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      'Alrady have an account? ',
                      style: GoogleFonts.poppins(
                        color: themecolor.onSurfaceVariant,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go('/');
                      },
                      child: AutoSizeText(
                        'Login',
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

  @override
  void dispose() {
    email.dispose();
    username.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
