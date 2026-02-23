import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/utils/extensions.dart';
import '../../../../core/common/utils/screen_utils.dart';
import '../../../../core/common/widgets/buttons/icons_button.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: ScreenUtils.getDrawerWidth(context),
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconsButton(
                  icon: Icon(Icons.close, color: AppColors.black, size: 24.sp),
                  onPressed: () => Navigator.of(context).maybePop(),
                ),
              ],
            ),
            ListTile(
              leading: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.primaryColor,
                size: 24.sp,
              ),
              title: Text(
                context.locale!.privacyPolicy.toUpperCase(),
                style: AppTextStyles.buttonFont.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              onTap: () => context.push(AppRoutes.privacyPolicy.path),
            ),
            ListTile(
              leading: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.primaryColor,
                size: 24.sp,
              ),
              title: Text(
                context.locale!.termsOfService.toUpperCase(),
                style: AppTextStyles.buttonFont.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              onTap: () => context.push(AppRoutes.termsOfService.path),
            ),
          ],
        ),
      ),
    );
  }
}
