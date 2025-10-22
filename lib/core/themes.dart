import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.redAccent,
    scaffoldBackgroundColor: Colors.grey[50],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 1,
      iconTheme: const IconThemeData(color: Colors.black87),
      titleTextStyle: GoogleFonts.poppins(
        color: Colors.black87,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    ),
    cardColor: Colors.white,
    dividerColor: Colors.grey[300],
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.redAccent,
      foregroundColor: Colors.white,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
      ThemeData.light().textTheme,
    ).copyWith(
      headlineSmall: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black87,
      ),
      bodyLarge: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.grey[800],
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.redAccent,
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF1F1F1F),
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: GoogleFonts.poppins(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    ),
    cardColor: const Color(0xFF1F1F1F),
    dividerColor: Colors.grey[700],
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.redAccent,
      foregroundColor: Colors.white,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
      ThemeData.dark().textTheme,
    ).copyWith(
      headlineSmall: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
      bodyLarge: const TextStyle(
        fontSize: 16,
        color: Colors.white70,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.grey[400],
      ),
    ),
  );
}