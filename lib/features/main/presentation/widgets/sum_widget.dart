import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../blocs/amount_cubit.dart';

class SumWidget extends StatelessWidget {
  const SumWidget({super.key, this.isMediumScreen = false});

  final bool isMediumScreen;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AmountCubit, AmountState>(
      builder: (context, state) {
        return Container(
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
              padding: EdgeInsets.symmetric(
                horizontal: !isMediumScreen ? 8.w : 32.w,
                vertical: !isMediumScreen ? 8.w : 16.w,
              ),
              child: Text(
                '\$ ${state.amount}'.toUpperCase(),
                style: AppTextStyles.buttonFont.copyWith(
                  color: AppColors.menuContainerColor,
                  fontSize: !isMediumScreen ? 16.sp : 20.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
