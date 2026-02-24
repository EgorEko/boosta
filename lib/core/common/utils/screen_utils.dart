import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'extensions.dart';

class SpacingConfig {
  const SpacingConfig({
    required this.bodySpacing,
    required this.gridSpacing,
    required this.sectionSpacing,
    required this.smallSpacing,
    required this.buttonSpacing,
  });

  final double bodySpacing;
  final double gridSpacing;
  final double sectionSpacing;
  final double smallSpacing;
  final double buttonSpacing;
}

class ScreenUtils {
  static double getWidthFactor(BoxConstraints constraints) {
    switch (constraints.maxWidth) {
      case > 900:
        return 0.7;
      case > 600:
        return 0.8;
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
    final screenWidth = context.getWidth;

    switch (screenWidth) {
      case > 900:
        return 420;
      default:
        return screenWidth * 0.85;
    }
  }

  static SpacingConfig getPlatformSpacing(BoxConstraints constraints) {
    if (Platform.isIOS) {
      final spacing = switch (constraints.maxHeight) {
        > 900 => SpacingConfig(
          bodySpacing: 12.h,
          gridSpacing: 16.h,
          sectionSpacing: 16.h,
          smallSpacing: 8.h,
          buttonSpacing: 12.h,
        ),
        > 600 => SpacingConfig(
          bodySpacing: 48.h,
          gridSpacing: 12.h,
          sectionSpacing: 12.h,
          smallSpacing: 6.h,
          buttonSpacing: 8,
        ),
        _ => SpacingConfig(
          bodySpacing: 48.h,
          gridSpacing: 8.h,
          sectionSpacing: 8.h,
          smallSpacing: 4.h,
          buttonSpacing: 6.h,
        ),
      };
      return spacing;
    }
    if (Platform.isAndroid) {
      return SpacingConfig(
        bodySpacing: 12.h,
        gridSpacing: 12.h,
        sectionSpacing: 8.h,
        smallSpacing: 6.h,
        buttonSpacing: 8.h,
      );
    }
    return SpacingConfig(
      bodySpacing: 12.h,
      gridSpacing: 32.h,
      sectionSpacing: 12.h,
      smallSpacing: 12.h,
      buttonSpacing: 16.h,
    );
  }
}
