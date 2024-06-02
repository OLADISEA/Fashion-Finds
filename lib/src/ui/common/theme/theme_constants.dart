import 'package:flutter/material.dart';

class ThemeConstants {
  static ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade300,
      primary: Colors.grey.shade500,
      secondary: Colors.grey.shade200,
      inversePrimary: Colors.grey.shade900,
    ),
  );

  static ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: Colors.grey.shade600,
      secondary: Colors.grey.shade800,
      inversePrimary: Colors.grey.shade300,
    ),
  );
}
