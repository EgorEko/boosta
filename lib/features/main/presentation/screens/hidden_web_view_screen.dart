import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/common/utils/extensions.dart';
import '../../../../core/common/widgets/buttons/arrow_back_button.dart';
import '../../../../core/common/widgets/buttons/primary_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class HiddenWebViewScreen extends StatelessWidget {
  const HiddenWebViewScreen({super.key, required this.controller});

  final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(
              controller: controller,
              layoutDirection: TextDirection.ltr,
            ),
            Positioned(
              top: 50.h,
              child: ArrowBackButton(onPressed: () => context.pop()),
            ),
          ],
        ),
      ),
      floatingActionButton: PrimaryButton(
        onPressed: () {}, //TODO: implement the function of obtaining a loan
        child: Text(
          context.locale!.applyForALoan.toUpperCase(),
          style: AppTextStyles.buttonFont.copyWith(color: AppColors.black),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
