import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.color = AppColors.primaryColor,
    required this.onPressed,
    required this.child,
  });

  final Color color;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40.r)),
          boxShadow: [
            BoxShadow(color: AppColors.black, offset: Offset(7.w, 7.h)),
          ],
        ),
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: color,
            side: BorderSide.none,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
            child: child,
          ),
        ),
      ),
    );
  }
}
