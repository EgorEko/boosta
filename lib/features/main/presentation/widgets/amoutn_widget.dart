import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/utils/extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../blocs/amount_cubit.dart';

class AmountWidget extends StatelessWidget {
  const AmountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = context.getWidth <= 320;
    return BlocBuilder<AmountCubit, AmountState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SizedBox(
            width: double.infinity,
            height: isSmallScreen ? 8.w : 20.h,
            child: Row(
              children: List.generate(7, (index) {
                final bool isPainted = index <= state.divisions - 1;
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
                        right: index == 6
                            ? Radius.circular(100.r)
                            : Radius.zero,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
