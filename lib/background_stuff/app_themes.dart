import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData blue() {
    return ThemeData(
      brightness: Brightness.light,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: Colors.grey[200],
      primaryColor: Colors.blue,
    );
  }

  static ThemeData red() {
    return ThemeData(
      brightness: Brightness.light,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: Colors.grey[200],
      primaryColor: Colors.red,
    );
  }

  static ThemeData green() {
    return ThemeData(
      brightness: Brightness.light,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: Colors.grey[200],
      primaryColor: Colors.green,
    );
  }
}
