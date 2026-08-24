import 'package:flutter/material.dart';

Widget customTextField(
  BuildContext context, {
  required TextEditingController controller,
  required String hintText,
  IconData? prefixIcon,
  Widget? suffixIcon,
  TextInputType? keyboardType,
  bool obscureText = false,
}) {
  final themecolor = Theme.of(context).colorScheme;
  return TextFormField(
    controller: controller,
    autocorrect: true,
    cursorColor: themecolor.primary,
    keyboardType: keyboardType,
    obscureText: obscureText,

    decoration: InputDecoration(
      filled: true,
      fillColor: themecolor.surface,
      hintText: hintText,
      hintStyle: TextStyle(color: themecolor.onSurfaceVariant),
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: themecolor.onSurfaceVariant)
          : null,
      suffixIcon: suffixIcon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: themecolor.primary, width: 1),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: themecolor.primary, width: 2),
      ),
    ),
  );
}
