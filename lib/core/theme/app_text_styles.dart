import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  static final appBarPrimary = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );

  static final buttonTextStyle = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
  );

  static final titlePrimaryTextStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );

  static final titleSecondaryTextStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static final dateTextStyle = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
  );

  static final timeTextStyle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static final dropdownContentTextStyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
}
