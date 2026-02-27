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
    if (Platform.isIOS) {
      switch (context.getWidth) {
        case > 900:
          return 1.95;
        case > 400:
          return 1.2;
        default:
          return 1.5;
      }
    }
    if (Platform.isAndroid) {
      switch (context.getWidth) {
        case > 600:
          return 1.8;
        case > 400:
          return 1.6;
        case > 320:
          return 1.25;
        default:
          return 1.62;
      }
    }
    return 2;
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

  static SpacingConfig getPlatformSpacing(BuildContext context) {
    if (Platform.isIOS) {
      final spacing = switch (context.getWidth) {
        > 1000 => SpacingConfig(
          bodySpacing: 16.h,
          gridSpacing: 16.h,
          sectionSpacing: 8.h,
          smallSpacing: 6.h,
          buttonSpacing: 8.h,
        ),
        > 400 => SpacingConfig(
          bodySpacing: 64.h,
          gridSpacing: 16.h,
          sectionSpacing: 12.h,
          smallSpacing: 6.h,
          buttonSpacing: 8,
        ),
        _ => SpacingConfig(
          bodySpacing: 98.h,
          gridSpacing: 8.h,
          sectionSpacing: 8.h,
          smallSpacing: 4.h,
          buttonSpacing: 6.h,
        ),
      };
      return spacing;
    }
    if (Platform.isAndroid) {
      final spacing = switch (context.getWidth) {
        > 600 => SpacingConfig(
          bodySpacing: 22.h,
          gridSpacing: 16.h,
          sectionSpacing: 8.h,
          smallSpacing: 6.h,
          buttonSpacing: 8.h,
        ),
        > 400 => SpacingConfig(
          bodySpacing: 36.h,
          gridSpacing: 6.h,
          sectionSpacing: 6.h,
          smallSpacing: 2.h,
          buttonSpacing: 2.h,
        ),
        > 320 => SpacingConfig(
          bodySpacing: 30.h,
          gridSpacing: 6.h,
          sectionSpacing: 4.h,
          smallSpacing: 2.h,
          buttonSpacing: 8.h,
        ),
        _ => SpacingConfig(
          bodySpacing: 2.h,
          gridSpacing: 4.h,
          sectionSpacing: 2.h,
          smallSpacing: 2.h,
          buttonSpacing: 2.h,
        ),
      };
      return spacing;
    }
    return SpacingConfig(
      bodySpacing: 12.h,
      gridSpacing: 32.h,
      sectionSpacing: 12.h,
      smallSpacing: 12.h,
      buttonSpacing: 16.h,
    );
  }

  static double getAndroidWidgetHeight(BuildContext context) {
    final spacing = switch (context.getWidth) {
      > 600 => context.getHeight * 0.76,
      > 400 => context.getHeight * 0.76,
      > 320 => context.getHeight * 0.72,
      _ => context.getHeight * 0.72,
    };
    return spacing;
  }
}

/*final bool isSmallScreen = context.getWidth <= 320;

    final bool isMediumScreen =
        context.getWidth > 320 && context.getWidth < 400;

    final bool isUMediumScreen =
        context.getWidth > 400 && context.getWidth < 600;

    final bool isLargeScreen = context.getWidth > 600;*/
