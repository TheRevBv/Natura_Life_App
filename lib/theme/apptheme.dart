import 'package:flutter/material.dart';

class AppTheme {
  static Color primary = const Color.fromARGB(255, 255, 51, 51);
  static Color secundary = const Color.fromARGB(255, 255, 243, 240);
  static Color tertiary = const Color.fromARGB(255, 255, 230, 228);
  static Color fourth = const Color.fromARGB(255, 126, 177, 232);
  static Color fifth = const Color.fromARGB(255, 250, 195, 31);
  static Color white = const Color.fromARGB(255, 255, 235, 234);
  static Color dark = const Color.fromARGB(255, 52, 59, 64);

  static ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: primary,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(color: primary, elevation: 0),
      scaffoldBackgroundColor: white);

  static ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: primary,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(color: primary, elevation: 0),
      scaffoldBackgroundColor: dark);
}
