import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_colors.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({
    super.key,
    this.color = AppColors.primaryColor,
    required this.onPressed,
  });

  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Container(
        width: 48.r,
        height: 48.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40.r)),
          boxShadow: [
            BoxShadow(color: AppColors.black, offset: Offset(7.w, 7.h)),
          ],
        ),
        child: IconButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: color,
            side: BorderSide.none,
          ),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.black,
            size: 20.sp,
          ),
        ),
      ),
    );
  }
}
