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

class TermsOfService extends StatelessWidget {
  const TermsOfService({super.key});

  @override
  Widget build(BuildContext context) {
    final titles = [
      context.locale!.termsOfService1,
      context.locale!.termsOfService2,
      context.locale!.termsOfService3,
      context.locale!.termsOfService,
      context.locale!.termsOfService5,
      context.locale!.termsOfService6,
      context.locale!.termsOfService7,
      context.locale!.termsOfService8,
      context.locale!.termsOfService9,
    ];
    final texts = [
      context.locale!.termsOfService1Text,
      context.locale!.termsOfService2Text,
      context.locale!.termsOfService3Text,
      context.locale!.termsOfService4Text,
      context.locale!.termsOfService5Text,
      context.locale!.termsOfService6Text,
      context.locale!.termsOfService7Text,
      context.locale!.termsOfService8Text,
      context.locale!.termsOfService9Text,
    ];
    return Scaffold(
      body: BGWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      ArrowBackServicesButton(onPressed: () => context.pop()),
                      Spacer(flex: 1),
                      Column(
                        children: [
                          Text(
                            '${context.locale!.termsOfServiceCommon.split(' ').first.toUpperCase()} ${context.locale!.termsOfServiceCommon.split(' ')[1].toUpperCase()}',
                            style: AppTextStyles.primaryFont.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                          8.verticalSpace,
                          Text(
                            context.locale!.termsOfServiceCommon
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
                    title: context.locale!.termsOfServiceCommon,
                    text: Text(
                      context.locale!.termsOfServiceCommonText,
                      style: AppTextStyles.serviceTextFont,
                    ),
                    isBordered: false,
                    child: Transform.rotate(
                      angle: -45,
                      child: Icon(Icons.arrow_forward, size: 24.r),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return FieldContainer(
                        title: titles[index],
                        text: RichTextUtils.buildTermsOfServiceRichText(
                          context,
                          texts[index],
                          index.toString(),
                        ),
                        bgColor: AppColors.white,
                        child: Transform.rotate(
                          angle: -45,
                          child: Icon(Icons.arrow_forward, size: 24.r),
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
