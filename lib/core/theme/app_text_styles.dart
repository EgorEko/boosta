import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppTextStyles {
  static final primaryFont =
      GoogleFonts.googleSansCode(
        fontSize: 55.sp,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.sp,
      ).copyWith(
        height: 0.8,
        leadingDistribution: TextLeadingDistribution.even,
        shadows: [Shadow(color: AppColors.black, offset: Offset(4.w, 4.h))],
      );

  static final menuTitleFont = GoogleFonts.googleSansCode(
    fontSize: 40.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.sp,
    shadows: [Shadow(color: AppColors.black, offset: Offset(4.w, 4.h))],
  );

  static final secondaryFont = GoogleFonts.googleSansCode(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.sp,
    height: 1.0,
  );

  static final buttonFont = GoogleFonts.googleSansCode(
    fontSize: 20.sp,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.sp,
  );

  static final amountFont = GoogleFonts.googleSansCode(
    fontSize: 55.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.sp,
  );

  static final amountCountFont = GoogleFonts.googleSansCode(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.sp,
  );
  static final serviceFont = GoogleFonts.googleSansCode(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.sp,
  );
}
