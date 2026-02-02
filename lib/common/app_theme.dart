import 'package:flutter/material.dart';

/// Application theme configuration
/// Centralizes colors, text styles, and theme data
class AppTheme {
  AppTheme._(); // Private constructor to prevent instantiation

  // Primary Colors
  static const Color primaryBlue = Color(0xFF1E88E5);
  static final Color primaryBlueShade600 = Colors.blue.shade600;
  static final Color primaryBlueShade700 = Colors.blue.shade700;
  static final Color primaryBlueShade100 = Colors.blue.shade100;
  static final Color primaryBlueShade900 = Colors.blue.shade900;

  // Accent Colors
  static final Color successGreen = Colors.green.shade600;
  static const Color errorRed = Colors.red;
  static final Color warningAmber = Colors.amber.shade600;

  // Neutral Colors
  static const Color white = Colors.white;
  static final Color grey50 = Colors.grey.shade50;
  static final Color grey200 = Colors.grey.shade200;
  static final Color grey300 = Colors.grey.shade300;
  static final Color grey500 = Colors.grey.shade500;
  static const Color grey = Colors.grey;

  // Text Styles
  static const TextStyle headerLarge = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
  );

  static const TextStyle headerMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle labelStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.grey,
  );

  static const TextStyle priceStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.green,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  // Theme Data
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      useMaterial3: true,
      scaffoldBackgroundColor: grey50,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryBlueShade600,
        elevation: 0,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: white,
        ),
        iconTheme: const IconThemeData(color: white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlueShade600,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  // Common Decorations
  static BoxDecoration cardDecoration({double radius = 12}) {
    return BoxDecoration(
      color: white,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  static BoxDecoration headerGradient() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [primaryBlueShade600, primaryBlueShade700],
      ),
    );
  }

  // Common Padding & Spacing
  static const EdgeInsets pagePadding = EdgeInsets.all(16);
  static const EdgeInsets cardPadding = EdgeInsets.all(20);
  static const double defaultBorderRadius = 8.0;
  static const double cardBorderRadius = 12.0;
}
