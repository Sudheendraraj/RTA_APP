import 'package:flutter/material.dart';

class AppTheme {
  static const Color brandTeal = Color(0xFF0B7166);
  static const Color brandTealDark = Color(0xFF084F47);
  static const Color brandGold = Color(0xFFF2B33D);
  static const Color surfaceLight = Color(0xFFF3F7F6);

  static final ColorScheme _lightScheme = ColorScheme.fromSeed(
    seedColor: brandTeal,
    brightness: Brightness.light,
    primary: brandTeal,
    secondary: const Color(0xFF00A49F),
  ).copyWith(surface: surfaceLight, onSurface: Colors.black87);

  static final ThemeData lightTheme = ThemeData(
    colorScheme: _lightScheme,
    useMaterial3: true,
    scaffoldBackgroundColor: _lightScheme.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: brandTeal,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: brandGold,
        foregroundColor: brandTealDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      labelStyle: const TextStyle(color: Colors.black87),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineSmall: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),
      labelLarge: TextStyle(fontSize: 12, color: Colors.black54),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: _lightScheme.copyWith(brightness: Brightness.dark),
    useMaterial3: true,
  );
}
