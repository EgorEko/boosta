import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_colors.dart';

class ArrowBackServicesButton extends StatelessWidget {
  const ArrowBackServicesButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.arrow_back, color: AppColors.white, size: 24.sp),
      ),
    );
  }
}
