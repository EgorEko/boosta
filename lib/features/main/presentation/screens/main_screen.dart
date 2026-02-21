import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/utils/extensions.dart';
import '../../../../core/common/utils/screen_utils.dart';
import '../../../../core/common/widgets/bg_widgets/bg_widget.dart';
import '../../../../core/common/widgets/buttons/primary_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../gen/assets.gen.dart';
import '../widgets/amoutn_widget.dart';
import '../widgets/grid_item_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      context.locale!.customAmounts,
      context.locale!.noExtraCharges,
      context.locale!.dataSecurity,
      context.locale!.fastPayouts,
    ];

    final List<Image> icons = [
      Assets.elements.fluentMoney16Filled.image(width: 24.w, height: 24.h),
      Assets.elements.fluentDataPie24Regular.image(width: 24.w, height: 24.h),
      Assets.elements.mingcuteSafeLockLine.image(width: 24.w, height: 24.h),
      Assets.elements.mdiClockFast.image(width: 24.w, height: 24.h),
    ];

    return Scaffold(
      body: BGWidget(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              context.locale!.fast.toUpperCase(),
                              style: AppTextStyles.menuTitleFont.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                            12.horizontalSpace,
                            Text(
                              context.locale!.loans.toUpperCase(),
                              style: AppTextStyles.menuTitleFont.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                            Spacer(),
                            Assets.icons.infoIcon.image(
                              width: 56.w,
                              height: 56.h,
                            ),
                          ],
                        ),
                        (constraints.maxHeight > 900 ? 12 : 24).verticalSpace,
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: titles.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: (constraints.maxHeight > 900
                                    ? 16
                                    : 32),
                                mainAxisSpacing: (constraints.maxHeight > 900
                                    ? 16
                                    : 32),
                                childAspectRatio: ScreenUtils.getAspectRatio(
                                  context,
                                ),
                              ),
                          itemBuilder: (_, index) => GridItemWidget(
                            title: titles[index],
                            icon: icons[index],
                          ),
                        ),
                        (constraints.maxHeight > 900 ? 16 : 32).verticalSpace,
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40.r),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black,
                                offset: Offset(10.w, 10.h),
                              ),
                            ],
                          ),

                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(40.r),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 32.w,
                                vertical: 16.h,
                              ),
                              child: Text(
                                '\$ 500'.toUpperCase(),
                                style: AppTextStyles.buttonFont.copyWith(
                                  color: AppColors.menuContainerColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        (constraints.maxHeight > 900 ? 6 : 12).verticalSpace,
                        AmountWidget(painted: 2),
                        (constraints.maxHeight > 900 ? 6 : 12).verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$100',
                              style: AppTextStyles.amountCountFont.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                            Text(
                              '\$5000',
                              style: AppTextStyles.amountCountFont.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                        (constraints.maxHeight > 900 ? 8 : 16).verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.icons.security.image(),
                            5.horizontalSpace,
                            Text(
                              context.locale!.builtInSecurity,
                              style: AppTextStyles.serviceFont.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        PrimaryButton(
                          onPressed: () {},
                          child: Text(
                            context.locale!.applyForALoan.toUpperCase(),
                            style: AppTextStyles.buttonFont.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
