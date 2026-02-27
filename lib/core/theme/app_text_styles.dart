import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

abstract class AppTextStyles {
  static TextStyle primaryFont =
      TextStyle(
        fontFamily: 'GoogleSansCode',
        fontSize: 55.sp,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.sp,
      ).copyWith(
        height: 0.8,
        leadingDistribution: TextLeadingDistribution.even,
        shadows: [Shadow(color: AppColors.black, offset: Offset(4.w, 4.h))],
      );

  static TextStyle menuTitleFont = TextStyle(
    fontFamily: 'GoogleSansCode',
    fontSize: 40.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.sp,
    shadows: [Shadow(color: AppColors.black, offset: Offset(4.w, 4.h))],
  );

  static TextStyle secondaryFont = TextStyle(
    fontFamily: 'GoogleSansCode',
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.sp,
    height: 1.0,
  );

  static TextStyle buttonFont = TextStyle(
    fontFamily: 'GoogleSansCode',
    fontSize: 20.sp,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.sp,
  );

  static TextStyle amountFont = TextStyle(
    fontFamily: 'GoogleSansCode',
    fontSize: 55.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.sp,
  );

  static TextStyle amountCountFont = TextStyle(
    fontFamily: 'GoogleSansCode',
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.sp,
  );
  static TextStyle serviceFont = TextStyle(
    fontFamily: 'GoogleSansCode',
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.sp,
  );

  static TextStyle sumFont = TextStyle(
    fontFamily: 'GoogleSansCode',
    fontSize: 55.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.sp,
  );

  static TextStyle serviceTitleFont = TextStyle(
    fontFamily: 'Avenir',
    fontSize: 16.sp,
    fontWeight: FontWeight.w900,
    letterSpacing: 0,
    height: 1.0,
  );

  static TextStyle serviceTextFont = TextStyle(
    fontFamily: 'Avenir',
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );
}
