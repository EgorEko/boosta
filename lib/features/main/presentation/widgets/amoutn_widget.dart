import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class AmountWidget extends StatelessWidget {
  const AmountWidget({super.key, required this.painted});

  final int painted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: SizedBox(
        width: double.infinity,
        height: 20.h,
        child: Row(
          children: List.generate(7, (index) {
            final bool isPainted = index <= painted - 1;
            final Color color = isPainted
                ? AppColors.primaryColor
                : AppColors.amountProgressColor;

            final bool isLast = index == 6;

            return Expanded(
              child: Container(
                margin: EdgeInsets.only(right: isLast ? 0 : 4.w),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.horizontal(
                    left: index == 0 ? Radius.circular(100.r) : Radius.zero,
                    right: index == 6 ? Radius.circular(100.r) : Radius.zero,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
