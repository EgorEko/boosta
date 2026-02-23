import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/utils/extensions.dart';
import '../../../../core/common/utils/rich_text_utils.dart';
import '../../../../core/common/widgets/bg_widgets/bg_widget.dart';
import '../../../../core/common/widgets/buttons/arrow_back_services_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/field_container.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    final titles = [
      context.locale!.privacyPolicy1,
      context.locale!.privacyPolicy2,
      context.locale!.privacyPolicy3,
      context.locale!.privacyPolicy4,
      context.locale!.privacyPolicy5,
      context.locale!.privacyPolicy6,
      context.locale!.privacyPolicy7,
      context.locale!.privacyPolicy8,
    ];
    final texts = [
      context.locale!.privacyPolicy1Text,
      context.locale!.privacyPolicy2Text,
      context.locale!.privacyPolicy3Text,
      context.locale!.privacyPolicy4Text,
      context.locale!.privacyPolicy5Text,
      context.locale!.privacyPolicy6Text,
      context.locale!.privacyPolicy7Text,
      context.locale!.privacyPolicy8Text,
    ];
    return Scaffold(
      body: BGWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      ArrowBackServicesButton(onPressed: () => context.pop()),
                      Spacer(flex: 1),
                      Column(
                        children: [
                          Text(
                            context.locale!.privacyPolicy
                                .split(' ')
                                .first
                                .toUpperCase(),
                            style: AppTextStyles.primaryFont.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            context.locale!.privacyPolicy
                                .split(' ')
                                .last
                                .toUpperCase(),
                            style: AppTextStyles.primaryFont.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Spacer(flex: 2),
                    ],
                  ),
                  24.verticalSpace,
                  FieldContainer(
                    title: context.locale!.privacyPolicy,
                    text: Text(
                      context.locale!.privacyPolicyCommonText,
                      style: AppTextStyles.serviceTextFont,
                    ),
                    isBordered: false,
                    onPressed: () {},
                    child: SizedBox(
                      width: 56.w,
                      height: 56.h,
                      child: Transform.rotate(
                        angle: -0.785398,
                        child: Icon(Icons.arrow_forward, size: 24.sp),
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return FieldContainer(
                        title: titles[index],
                        text: RichTextUtils.buildPrivacyPolicyRichText(
                          context,
                          texts[index],
                          index.toString(),
                        ),
                        bgColor: AppColors.white,
                        onPressed: () {},
                        child: SizedBox(
                          width: 56.w,
                          height: 56.h,
                          child: Transform.rotate(
                            angle: 0.785398,
                            child: Icon(Icons.arrow_forward, size: 24.sp),
                          ),
                        ),
                      );
                    },
                    itemCount: titles.length,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
