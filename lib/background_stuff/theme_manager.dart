import 'dart:math' as math;

import 'package:flutter/material.dart';

class ThemeManager {
  ThemeData themeData = ThemeData();

  ThemeData changeTheme({required ThemeData newThemeData}) => themeData = newThemeData;

  ThemeData red = ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.red));
  ThemeData green = ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green));
  ThemeData blue = ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue));

  ThemeData useRandomTheme() {
    final rand = math.Random();
    int a = rand.nextInt(256);
    int r = rand.nextInt(256);
    int g = rand.nextInt(256);
    int b = rand.nextInt(256);

    return changeTheme(
      newThemeData: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(a, r, g, b),
        ),
      ),
    );
  }
}
