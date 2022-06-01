import 'dart:math' as math;

import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  /// Creates an instance of [ThemeManager].
  ThemeManager();

  /// The current themeData for the app.
  ThemeData themeData = ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple));

  /// Changes the theme to any ThemeData object passed in.
  void changeTheme({required ThemeData newThemeData}) {
    themeData = newThemeData;
    notifyListeners();
  }

  /// Three pre-made ThemeData objects used for simplicity.
  ThemeData red = ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.red));
  ThemeData green = ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green));
  ThemeData blue = ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue));

  /// Uses RNG to create a color, then uses that color as the seed
  /// for a ColorScheme, which is used to make a new ThemeData
  /// object. That object is then passed into changeTheme(), updating
  /// the app with a random set of theme colors.
  void useRandomTheme() {
    final rand = math.Random();
    int a = rand.nextInt(256);
    int r = rand.nextInt(256);
    int g = rand.nextInt(256);
    int b = rand.nextInt(256);

    changeTheme(
      newThemeData: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(a, r, g, b),
        ),
      ),
    );
  }
}
