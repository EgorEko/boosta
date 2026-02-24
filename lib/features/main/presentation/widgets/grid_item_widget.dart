import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/utils/extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class GridItemWidget extends StatelessWidget {
  const GridItemWidget({super.key, required this.title, required this.icon});

  final String title;
  final Image icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getHeight * 0.03,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40.r)),
        boxShadow: [
          BoxShadow(color: AppColors.black, offset: Offset(10.w, 10.h)),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(40.r)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: AppColors.menuContainerColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor,
                      offset: Offset(4.w, 4.h),
                    ),
                  ],
                ),
                child: icon,
              ),
              2.verticalSpace,
              Text(
                title.toUpperCase(),
                style: AppTextStyles.buttonFont,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
