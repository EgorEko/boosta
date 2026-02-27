import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/utils/extensions.dart';
import '../../../../core/common/utils/screen_utils.dart';
import '../../../../core/common/widgets/buttons/icons_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'amoutn_widget.dart';
import 'grid_item_widget.dart';

class IosBodyWidget extends StatelessWidget {
  const IosBodyWidget({
    super.key,
    required this.titles,
    required this.scaffoldKey,
    required this.icons,
  });

  final List<String> titles;
  final List<Image> icons;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final spacing = ScreenUtils.getPlatformSpacing(context);
          return IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SizedBox(
                height: context.getWidth > 400 && context.getWidth < 900
                    ? context.getHeight * 0.735
                    : context.getHeight * 0.78,
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
                        IconsButton(
                          onPressed: () =>
                              scaffoldKey.currentState?.openEndDrawer(),
                          icon: Icon(
                            Icons.info_outline_rounded,
                            color: AppColors.white,
                            size: 24.sp,
                          ),
                        ),
                      ],
                    ),
                    spacing.sectionSpacing.verticalSpace,
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: titles.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: spacing.gridSpacing,
                        mainAxisSpacing: spacing.gridSpacing,
                        childAspectRatio: ScreenUtils.getAspectRatio(context),
                      ),
                      itemBuilder: (_, index) => GridItemWidget(
                        title: titles[index],
                        icon: icons[index],
                      ),
                    ),
                    spacing.bodySpacing.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.getWidth * 0.25,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(40.r)),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black,
                              offset: Offset(10.w, 10.h),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 4.h,
                          ),
                          child: Text(
                            '\$500'.toUpperCase(),
                            style: AppTextStyles.sumFont.copyWith(
                              color: AppColors.menuContainerColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    spacing.gridSpacing.verticalSpace,
                    AmountWidget(painted: 2),
                    spacing.smallSpacing.verticalSpace,
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
