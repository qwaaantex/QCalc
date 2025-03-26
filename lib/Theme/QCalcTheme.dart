import 'package:flutter/material.dart';

ThemeData qCalcThemeDark() {
  return ThemeData(
    iconTheme: IconThemeData(color: Colors.white),
    cardColor: Colors.deepOrange.shade400,
    focusColor: Colors.deepOrange.shade400,
    scaffoldBackgroundColor: Colors.black,
    indicatorColor: Colors.black,
    highlightColor: Colors.white,

    dialogBackgroundColor: Colors.indigo,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        overlayColor: Colors.transparent,
      ),
    ),
    canvasColor: Colors.transparent,
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.black, fontSize: 28),
      bodySmall: TextStyle(color: Colors.white, fontSize: 18),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(color: Colors.grey, fontSize: 16),
      labelMedium: TextStyle(color: Colors.black, fontSize: 20),
      labelLarge: TextStyle(color: Colors.black, fontSize: 18),
    ),
  );
}

ThemeData qCalcThemeLight() {
  return ThemeData(
    iconTheme: IconThemeData(color: Colors.black),
    cardColor: Colors.deepOrange.shade400,
    scaffoldBackgroundColor: Colors.white,
    focusColor: Colors.deepOrange.shade400,
    highlightColor: Colors.white,
    indicatorColor: Colors.black,
    dialogBackgroundColor: Colors.indigo,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        overlayColor: Colors.transparent,
      ),
    ),
    canvasColor: Colors.transparent,
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.white, fontSize: 28),
      bodySmall: TextStyle(color: Colors.black, fontSize: 18),
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(color: Colors.grey, fontSize: 16),
      labelMedium: TextStyle(color: Colors.white, fontSize: 20),
      labelLarge: TextStyle(color: Colors.black, fontSize: 18),
    ),
  );
}
