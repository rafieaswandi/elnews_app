import 'package:flutter/material.dart';

class Themes {
  // Color palette
  static const Color primaryColor = Color(0xFF978228);
  static const Color secondaryColor = Color(0xFFC5C4B9);
  static const Color darkBackground = Color(0xFF151515);
  static const Color lightBackground = Color(0xFFFDFDFD);

  // DARK THEME
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: "JMH Beda", // 👈 Apply font
      primaryColor: primaryColor,
      scaffoldBackgroundColor: darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: secondaryColor,
        background: darkBackground,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: darkBackground,
        elevation: 0,
        iconTheme: IconThemeData(color: secondaryColor),
        titleTextStyle: TextStyle(
          fontFamily: "JMH Beda",
          color: secondaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontFamily: "JMH Beda", color: secondaryColor, fontSize: 16),
        bodyMedium: TextStyle(fontFamily: "JMH Beda", color: secondaryColor, fontSize: 14),
        bodySmall: TextStyle(fontFamily: "JMH Beda", color: secondaryColor, fontSize: 12),
        titleLarge: TextStyle(fontFamily: "JMH Beda", color: primaryColor, fontWeight: FontWeight.bold, fontSize: 22),
      ),
    );
  }

  // LIGHT THEME
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: "JMH Beda", // 👈 Apply font
      primaryColor: primaryColor,
      scaffoldBackgroundColor: lightBackground,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        background: lightBackground,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: lightBackground,
        elevation: 0,
        iconTheme: IconThemeData(color: darkBackground),
        titleTextStyle: TextStyle(
          fontFamily: "JMH Beda",
          color: darkBackground,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontFamily: "JMH Beda", color: darkBackground, fontSize: 16),
        bodyMedium: TextStyle(fontFamily: "JMH Beda", color: darkBackground, fontSize: 14),
        bodySmall: TextStyle(fontFamily: "JMH Beda", color: darkBackground, fontSize: 12),
        titleLarge: TextStyle(fontFamily: "JMH Beda", color: primaryColor, fontWeight: FontWeight.bold, fontSize: 22),
      ),
    );
  }
}
