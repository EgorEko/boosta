import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/utils/extensions.dart';
import '../../../../core/common/utils/screen_utils.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class NoInternetBodyWidget extends StatelessWidget {
  const NoInternetBodyWidget({
    super.key,
    required this.firstTitle,
    required this.secondTitle,
    required this.slogan,
    required this.centerIcon,
    required this.centerRightIcon,
  });

  final String firstTitle;
  final String secondTitle;
  final String slogan;
  final Image centerIcon;
  final Image centerRightIcon;

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
              color: AppColors.primaryColor,
            ),
          ),
          Text(
            secondTitle.toUpperCase(),
            style: AppTextStyles.primaryFont.copyWith(color: AppColors.white),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.w),
            child: Text(
              slogan,
              style: AppTextStyles.secondaryFont.copyWith(
                color: AppColors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: context.getHeight * 0.45,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final widthFactor = ScreenUtils.getWidthFactor(constraints);
                final double containerWidth =
                    constraints.maxWidth * widthFactor;
                final double height = containerWidth * 1.3 * widthFactor;
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: containerWidth,
                    maxHeight: height,
                  ),
                  child: Stack(
                    children: [
                      Align(alignment: Alignment.center, child: centerIcon),
                      Align(
                        alignment: const Alignment(0.9, -0.5),
                        child: centerRightIcon,
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
