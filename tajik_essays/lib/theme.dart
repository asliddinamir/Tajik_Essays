import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: const Color(0xFF1E88E5), // Blue color for the app bar
  hintColor: const Color(0xFFFFC107), // Yellow color for accents
  scaffoldBackgroundColor:
      const Color(0xFFF5F5F5), // Light gray background color
  fontFamily: 'Roboto', // Use Roboto font
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: Color(0xFF212121), // Dark gray for body text
      height: 1.5,
    ),
    labelMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: Color(0xFF757575), // Lighter gray for subtitles
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Color(0xFF1E88E5), // Blue color for the app bar
    iconTheme: IconThemeData(color: Colors.white),
  ),
);
