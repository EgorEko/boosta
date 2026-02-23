import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class FieldContainer extends StatelessWidget {
  const FieldContainer({
    super.key,
    this.color = AppColors.black,
    this.bgColor = AppColors.primaryColor,
    this.isBordered = true,
    required this.title,
    required this.text,
    required this.onPressed,
    required this.child,
  });

  final String title;
  final Widget text;
  final Color color;
  final Color bgColor;
  final bool isBordered;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(40.r)),
          boxShadow: [
            BoxShadow(color: AppColors.black, offset: Offset(10.w, 10.h)),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyles.serviceTitleFont.copyWith(
                        height: 1.0,
                      ),
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ),
                  InkWell(
                    onTap: onPressed,
                    child: Container(
                      width: 36.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: bgColor,
                        border: isBordered
                            ? BoxBorder.all(color: AppColors.black)
                            : null,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black,
                            offset: Offset(2.w, 2.h),
                          ),
                        ],
                      ),
                      child: child,
                    ),
                  ),
                ],
              ),
              text,
            ],
          ),
        ),
      ),
    );
  }
}
