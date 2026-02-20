import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppTextStyles {
  static final primaryFont = GoogleFonts.googleSansCode(
    fontSize: 55.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.sp,
    shadows: [Shadow(color: AppColors.black, offset: Offset(4.w, 4.h))],
    height: 1,
  );

  static final secondaryFont = GoogleFonts.googleSansCode(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.sp,
  );

  static final buttonFont = GoogleFonts.googleSansCode(
    fontSize: 20.sp,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.sp,
  );
}
