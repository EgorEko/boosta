import 'package:flutter/material.dart';

abstract class AppColors {
  static const white = Color.fromRGBO(255, 255, 255, 1.0);
  static const black = Color.fromRGBO(0, 0, 0, 1.0);
  static const primaryColor = Color.fromRGBO(255, 166, 0, 1.0);
  static const bgStartColor = Color.fromRGBO(94, 24, 238, 1);
  static const bgEndColor = Color.fromRGBO(49, 0, 150, 1);

  static List<Color> getGradient() {
    return [bgStartColor, bgEndColor];
  }
}
