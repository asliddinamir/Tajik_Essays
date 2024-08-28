import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: const Color(0xFF1E88E5),
  hintColor: const Color(0xFFFFC107),
  scaffoldBackgroundColor: const Color(0xFFF5F5F5),
  fontFamily: 'Roboto',
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 18.0, // Adjusted font size
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: Color(0xFF212121),
      height: 1.5,
    ),
    labelMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: Color(0xFF757575),
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Color(0xFF1E88E5),
    iconTheme: IconThemeData(color: Colors.white),
  ),
);
