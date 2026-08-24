import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  // ================ Light Colors ==================
  // Brand Colors
  static const Color primary = Color(0xFFF9437A);
  static const Color primaryDark = Color(0xFFF12946);
  static const Color secondary = Color(0xFF6342B1);

  // Background Colors
  static const Color background = Color(0xFFFEFDFE);
  static const Color surface = Color(0xFFFCF7FA);
  static const Color softPink = Color(0xFFFBE7F0);
  static const Color lightPink = Color(0xFFF8CCDA);

  // Text Colors
  static const Color textPrimary = Color(0xFF100F13);
  static const Color textDark = Color(0xFF251D37);
  static const Color textSecondary = Color(0xFF615E75);
  static const Color textMuted = Color(0xFF827E91);

  // Border Colors
  static const Color border = Color(0xFFD9D1E1);
  static const Color borderDark = Color(0xFFC0B8C7);

  // ================== Dark Colors ==================
  static const Color darkBackground = Color(0xFF100F13);
  static const Color darkSurface = Color(0xFF1A1720);
  static const Color darkSurfaceLow = Color(0xFF211D28);
  static const Color darkSurfaceHigh = Color(0xFF2B2532);

  static const Color darkTextPrimary = Color(0xFFF8F2F5);
  static const Color darkTextSecondary = Color(0xFFC9C1CB);
  static const Color darkBorder = Color(0xFF625B66);
  static const Color darkBorderVariant = Color(0xFF423B45);

  // ================ Light Colors Schme ================

  static const ColorScheme light = ColorScheme(
    brightness: Brightness.light,

    // PRIMARY
    primary: primary,
    onPrimary: Colors.white,
    primaryContainer: softPink,
    onPrimaryContainer: textDark,

    // SECONDARY
    secondary: secondary,
    onSecondary: Colors.white,
    secondaryContainer: lightPink,
    onSecondaryContainer: textDark,

    // ERROR / EMERGENCY
    error: primaryDark,
    onError: Colors.white,
    errorContainer: lightPink,
    onErrorContainer: textDark,

    // SURFACE
    surface: surface,
    onSurface: textPrimary,

    // BACKGROUND-STYLE SURFACE
    surfaceContainerLowest: background,
    surfaceContainerLow: background,
    surfaceContainer: softPink,
    surfaceContainerHigh: lightPink,
    surfaceContainerHighest: lightPink,

    // SURFACE TEXT
    onSurfaceVariant: textSecondary,

    // BORDER
    outline: border,
    outlineVariant: borderDark,

    // OTHER TEXT
    inverseSurface: textDark,
    onInverseSurface: background,
    inversePrimary: lightPink,

    // TERTIARY
    tertiary: secondary,
    onTertiary: Colors.white,
    tertiaryContainer: softPink,
    onTertiaryContainer: textMuted,
  );

  // ================ Dark Colors Scheme ===================
  static const ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,

    // Primary
    primary: Color(0xFFFF82A5),
    onPrimary: Color(0xFF4A001D),
    primaryContainer: Color(0xFF68002B),
    onPrimaryContainer: Color(0xFFFFD9E3),

    // Secondary
    secondary: Color(0xFFD0BCFF),
    onSecondary: Color(0xFF381E72),
    secondaryContainer: Color(0xFF4F378B),
    onSecondaryContainer: Color(0xFFEADDFF),

    // Emergency
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),

    // Surface
    surface: darkSurface,
    onSurface: darkTextPrimary,

    // Surface Containers
    surfaceContainerLowest: darkBackground,
    surfaceContainerLow: darkSurfaceLow,
    surfaceContainer: darkSurface,
    surfaceContainerHigh: darkSurfaceHigh,
    surfaceContainerHighest: Color(0xFF37303F),

    onSurfaceVariant: darkTextSecondary,

    // Borders
    outline: darkBorder,
    outlineVariant: darkBorderVariant,

    // Inverse
    inverseSurface: darkTextPrimary,
    onInverseSurface: darkBackground,
    inversePrimary: primary,

    // Tertiary
    tertiary: Color(0xFFEAB8D7),
    onTertiary: Color(0xFF4D153A),
    tertiaryContainer: Color(0xFF65304F),
    onTertiaryContainer: Color(0xFFFFD8EF),
  );

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: AppTheme.light,
    scaffoldBackgroundColor: AppTheme.background,
  );
  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    colorScheme: AppTheme.dark,
    scaffoldBackgroundColor: AppTheme.darkBackground,
  );
}
