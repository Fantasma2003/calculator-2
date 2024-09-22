import 'package:flutter/material.dart';

class AppTheme {

  /// Light Mode Theme
  static ThemeData lightMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: const Color(0xFFF1F2F3),
  );

  /// Dark Mode Theme
  static ThemeData darkMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xFF17171C),
  );
}