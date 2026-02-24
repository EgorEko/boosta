import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/utils/extensions.dart';
import '../../../../core/common/widgets/bg_widgets/bg_widget.dart';
import '../../../../core/common/widgets/buttons/primary_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../gen/assets.gen.dart';
import '../widgets/no_internet_body_widget.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key, required this.onPressed});

  final Future<void> Function() onPressed;

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  bool _isChecking = false;

  Future<void> _handleTryAgain() async {
    setState(() => _isChecking = true);

    await widget.onPressed();

    if (mounted) {
      setState(() => _isChecking = false);
    }
  }

  void _onButtonPressed() {
    _handleTryAgain();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BGWidget(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: NoInternetBodyWidget(
                      firstTitle: context.locale!.youOffline
                          .split(' ')
                          .first
                          .toUpperCase(),
                      secondTitle: context.locale!.youOffline
                          .split(' ')
                          .last
                          .toUpperCase(),
                      slogan: context.locale!.sloganNoInternet,
                      centerRightIcon: Assets.elements.noInternet.image(
                        fit: BoxFit.cover,
                      ),
                      centerIcon: Assets.elements.portraitNoInternet.image(
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  PrimaryButton(
                    onPressed: _isChecking ? () {} : _onButtonPressed,
                    child: _isChecking
                        ? SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.black,
                            ),
                          )
                        : Text(
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
      ),
    );
  }
}
