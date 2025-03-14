import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF003366),
    scaffoldBackgroundColor: Color(0xFF1E242C),
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF003366),
      secondary: Color(0xFF0CAF60),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );
}
