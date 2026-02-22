import 'package:flutter/material.dart';

import '../../../../core/common/utils/extensions.dart';
import '../../../../core/common/widgets/bg_widgets/bg_widget.dart';
import '../../../../core/common/widgets/buttons/primary_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../gen/assets.gen.dart';
import '../widgets/no_internet_body_widget.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NoInternetScreenContent();
  }
}

class NoInternetScreenContent extends StatefulWidget {
  const NoInternetScreenContent({super.key});

  @override
  State<NoInternetScreenContent> createState() =>
      _NoInternetScreenContentState();
}

class _NoInternetScreenContentState extends State<NoInternetScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BGWidget(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Center(
                  child: NoInternetBodyWidget(
                    firstTitle: context.locale!.speedy.toUpperCase(),
                    secondTitle: context.locale!.approvals.toUpperCase(),
                    slogan: context.locale!.sloganFirst,
                    centerRightIcon: Assets.elements.fluyingDol.image(
                      fit: BoxFit.cover,
                    ),
                    centerIcon: Assets.elements.portrait.image(
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                PrimaryButton(
                  onPressed: () {},
                  child: Text(
                    context.locale!.tryAgain.toUpperCase(),
                    style: AppTextStyles.buttonFont.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
