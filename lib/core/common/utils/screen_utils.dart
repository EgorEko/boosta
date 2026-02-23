import 'package:flutter/cupertino.dart';

import 'extensions.dart';

class ScreenUtils {
  static double getWidthFactor(BoxConstraints constraints) {
    switch (constraints.maxWidth) {
      case > 900:
        return 0.7;
      default:
        return 1.0;
    }
  }

  static double getAspectRatio(BuildContext context) {
    switch (context.getWidth) {
      case > 900:
        return 1.75;
      default:
        return 1.0;
    }
  }

  static double getDrawerWidth(BuildContext context) {
    switch (context.getWidth) {
      case > 900:
        return 0.3;
      default:
        return 0.5;
    }
  }
}
