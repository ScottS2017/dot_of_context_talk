import 'dart:math' as math;

import 'package:flutter/material.dart';

class AppTheme{

  static Color generateRandomColor(){
    Color result;
    final alpha = math.min(math.Random().nextInt(256), 75);
    final red = math.Random().nextInt(256);
    final green = math.Random().nextInt(256);
    final blue = math.Random().nextInt(256);
    result = Color.fromARGB(alpha, red, green, blue);
    return result;
  }



  static ColorScheme createColorSchemeBasedOn({required Color baseColor}){
    return ColorScheme.fromSeed(seedColor: baseColor);
  }
}