import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/utils/extensions.dart';
import '../../../../core/common/utils/screen_utils.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class OnboardingBodyWidget extends StatelessWidget {
  const OnboardingBodyWidget({
    super.key,
    required this.firstTitle,
    required this.secondTitle,
    required this.slogan,
    required this.leftTopIcon,
    required this.centerIcon,
    this.centerRightIcon,
    this.rightTopIcon,
    this.leftBottomIcon,
    this.rightBottomIcon,
    this.isReverse = false,
  });

  final String firstTitle;
  final String secondTitle;
  final String slogan;
  final Image leftTopIcon;
  final Image? rightTopIcon;
  final Image centerIcon;
  final bool isReverse;
  final Image? centerRightIcon;
  final Image? leftBottomIcon;
  final Image? rightBottomIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            firstTitle.toUpperCase(),
            style: AppTextStyles.primaryFont.copyWith(
              color: isReverse ? AppColors.white : AppColors.primaryColor,
            ),
          ),
          8.verticalSpace,
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              secondTitle.toUpperCase(),
              style: AppTextStyles.primaryFont.copyWith(
                color: isReverse ? AppColors.primaryColor : AppColors.white,
              ),
            ),
          ),
          16.verticalSpace,
          Text(
            slogan,
            style: AppTextStyles.secondaryFont.copyWith(color: AppColors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: context.getHeight * 0.5,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final widthFactor = ScreenUtils.getWidthFactor(constraints);
                final double containerWidth =
                    constraints.maxWidth * widthFactor;
                final double height = containerWidth * 1.1 * widthFactor;
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: containerWidth,
                    maxHeight: height,
                  ),
                  child: Stack(
                    children: [
                      Align(alignment: Alignment.center, child: centerIcon),
                      Align(
                        alignment: const Alignment(-0.8, -0.75),
                        child: leftTopIcon,
                      ),
                      if (rightTopIcon != null)
                        Align(
                          alignment: const Alignment(0.8, -0.75),
                          child: rightTopIcon!,
                        ),
                      if (centerRightIcon != null)
                        Align(
                          alignment: const Alignment(0.9, -0.5),
                          child: centerRightIcon!,
                        ),
                      if (leftBottomIcon != null)
                        Align(
                          alignment: const Alignment(-0.8, 1.05),
                          child: leftBottomIcon!,
                        ),
                      if (rightBottomIcon != null)
                        Align(
                          alignment: const Alignment(0.9, 1.05),
                          child: rightBottomIcon!,
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
