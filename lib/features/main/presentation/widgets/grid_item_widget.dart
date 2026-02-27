import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/common/utils/extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class GridItemWidget extends StatelessWidget {
  const GridItemWidget({super.key, required this.title, required this.icon});

  final String title;
  final ImageProvider icon;

  @override
  Widget build(BuildContext context) {
    final bool isMediumScreen =
        Platform.isAndroid && context.getWidth > 320 && context.getWidth < 400;
    final bool isLargeScreen = context.getWidth > 600;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(40.r),
        boxShadow: [
          BoxShadow(color: AppColors.black, offset: Offset(10.w, 10.h)),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: !isMediumScreen ? 2.w : 16.w,
        vertical: !isMediumScreen ? 2.w : 8.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIconCircle(isMediumScreen),
          4.verticalSpace,
          Text(
            title.toUpperCase(),
            style: isLargeScreen
                ? AppTextStyles.buttonFont.copyWith(fontSize: 16.sp)
                : AppTextStyles.buttonFont,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildIconCircle(bool isMediumScreen) {
    return Container(
      width: !isMediumScreen ? 40.w : 48.w,
      height: !isMediumScreen ? 40.w : 48.w,
      decoration: BoxDecoration(
        color: AppColors.menuContainerColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: AppColors.primaryColor, offset: Offset(4.w, 4.h)),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
        child: Center(
          child: Image(
            image: icon,
            width: 24.w,
            height: 24.h,
            gaplessPlayback: true,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
