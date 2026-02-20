import 'package:flutter/cupertino.dart';

class ScreenUtils {
  static double getWidthFactor(BoxConstraints constraints) {
    if (constraints.maxWidth > 900) {
      return 0.5;
    } else if (constraints.maxWidth > 600) {
      return 0.7;
    }
    return 1.0;
  }
}
