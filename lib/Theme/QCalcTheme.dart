import 'package:flutter/material.dart';

ThemeData qCalcThemeDark() {
  return ThemeData(
    iconTheme: IconThemeData(color: Colors.white),
    cardColor: Colors.deepOrange.shade200,
    focusColor: Colors.deepOrange.shade400,
    scaffoldBackgroundColor: Colors.black,
    highlightColor: Colors.white,

    dialogBackgroundColor: Colors.indigo,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        overlayColor: Colors.transparent,
      ),
    ),
    canvasColor: Colors.deepOrange.shade400,
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.black, fontSize: 28),
      bodySmall: TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
}

ThemeData qCalcThemeLight() {
  return ThemeData(
    iconTheme: IconThemeData(color: Colors.black),
    cardColor: Colors.deepOrange.shade200,
    scaffoldBackgroundColor: Colors.white,
    focusColor: Colors.deepOrange.shade400,
    highlightColor: Colors.white,
    dialogBackgroundColor: Colors.indigo,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        overlayColor: Colors.transparent,
      ),
    ),
    canvasColor: Colors.deepOrange.shade400,
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.white, fontSize: 28),
      bodySmall: TextStyle(color: Colors.black, fontSize: 18),
    ),
  );
}
