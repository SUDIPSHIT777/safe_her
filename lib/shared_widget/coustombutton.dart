import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ===================== Gradient button  ===============
Widget customGradientButton({
  required BuildContext context,
  required String text,
  required VoidCallback? onPressed,
  bool isLoading = false,
}) {
  final themecolor = Theme.of(context).colorScheme;

  return Container(
    width: double.infinity,
    height: 57,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [themecolor.primary, themecolor.secondary],
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: isLoading ? null : onPressed,
        child: Center(
          child: isLoading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: themecolor.onPrimary,
                    strokeWidth: 2.5,
                  ),
                )
              : AutoSizeText(
                  text,
                  style: GoogleFonts.poppins(
                    color: themecolor.onPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    ),
  );
}

// ================= Google Button ===================
Widget googleButton({
  required BuildContext context,
  required VoidCallback? onPressed,
}) {
  final themeColor = Theme.of(context).colorScheme;

  return SizedBox(
    width: double.infinity,
    height: 56,
    child: OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: themeColor.surface,
        foregroundColor: themeColor.onSurface,
        side: BorderSide(color: themeColor.outline, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/google.png', width: 27, height: 27),
          const SizedBox(width: 20),
          AutoSizeText(
            'Continue with Google',
            style: GoogleFonts.poppins(
              color: themeColor.onSurface,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}
