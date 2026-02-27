import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/utils/extensions.dart';
import '../../../../core/common/utils/screen_utils.dart';
import '../../../../core/common/widgets/buttons/icons_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../blocs/amount_cubit.dart';
import 'amoutn_widget.dart';
import 'grid_item_widget.dart';
import 'sum_widget.dart';

class IosBodyWidget extends StatelessWidget {
  const IosBodyWidget({
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
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final spacing = ScreenUtils.getPlatformSpacing(context);
          return IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SizedBox(
                height: ScreenUtils.getWidgetHeight(context),
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
                    SumWidget(),
                    spacing.gridSpacing.verticalSpace,
                    AmountWidget(),
                    spacing.smallSpacing.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => context.read<AmountCubit>().decrease(),
                          child: Text(
                            '\$100',
                            style: AppTextStyles.amountCountFont.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => context.read<AmountCubit>().increase(),
                          child: Text(
                            '\$5000',
                            style: AppTextStyles.amountCountFont.copyWith(
                              color: AppColors.white,
                            ),
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
