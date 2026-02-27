import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/utils/extensions.dart';
import '../../../../core/common/utils/screen_utils.dart';
import '../../../../core/common/widgets/buttons/icons_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'amoutn_widget.dart';
import 'grid_item_widget.dart';

class AndroidBodyWidget extends StatelessWidget {
  const AndroidBodyWidget({
    super.key,
    required this.titles,
    required this.scaffoldKey,
    required this.icons,
  });

  final List<String> titles;
  final List<ImageProvider> icons;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final bool isMediumScreen =
        context.getWidth > 320 && context.getWidth < 400;
    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = ScreenUtils.getPlatformSpacing(context);
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: !isMediumScreen ? 6.w : 16.w,
            vertical: !isMediumScreen ? 6.w : 16.h,
          ),
          child: SizedBox(
            height: ScreenUtils.getAndroidWidgetHeight(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                spacing.smallSpacing.verticalSpace,
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
                  itemBuilder: (_, index) =>
                      GridItemWidget(title: titles[index], icon: icons[index]),
                ),
                spacing.bodySpacing.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40.r)),
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
                      borderRadius: BorderRadius.all(Radius.circular(40.r)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: !isMediumScreen ? 8.w : 32.w,
                        vertical: !isMediumScreen ? 8.w : 16.w,
                      ),
                      child: Text(
                        '\$ 500'.toUpperCase(),
                        style: AppTextStyles.buttonFont.copyWith(
                          color: AppColors.menuContainerColor,
                          fontSize: !isMediumScreen ? 16.sp : 20.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                spacing.smallSpacing.verticalSpace,
                AmountWidget(painted: 2),
                spacing.smallSpacing.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$100',
                      style: AppTextStyles.amountCountFont.copyWith(
                        color: AppColors.white,
                        fontSize: !isMediumScreen ? 14.sp : 16.sp,
                      ),
                    ),
                    Text(
                      '\$5000',
                      style: AppTextStyles.amountCountFont.copyWith(
                        color: AppColors.white,
                        fontSize: !isMediumScreen ? 14.sp : 16.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
