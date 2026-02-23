import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/common/utils/extensions.dart';
import '../../../../core/common/widgets/buttons/arrow_back_button.dart';
import '../../../../core/common/widgets/buttons/primary_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class HiddenWebViewScreen extends StatefulWidget {
  const HiddenWebViewScreen({super.key, required this.controller});

  final WebViewController controller;

  @override
  State<HiddenWebViewScreen> createState() => _HiddenWebViewScreenState();
}

class _HiddenWebViewScreenState extends State<HiddenWebViewScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    widget.controller.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (String url) {
          setState(() {
            _isLoading = true;
          });
        },
        onPageFinished: (String url) {
          setState(() {
            _isLoading = false;
          });
        },
        onWebResourceError: (error) {
          setState(() {
            _isLoading = false;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(
              controller: widget.controller,
              layoutDirection: TextDirection.ltr,
            ),

            Positioned(
              top: 50.h,
              left: 16.w,
              child: ArrowBackButton(onPressed: () => context.pop()),
            ),

            if (_isLoading)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.transparent,
                  color: AppColors.primaryColor,
                  minHeight: 5.h,
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: PrimaryButton(
          onPressed: () {
            // TODO: implement logic
          },
          child: Text(
            context.locale!.applyForALoan.toUpperCase(),
            style: AppTextStyles.buttonFont.copyWith(color: AppColors.black),
          ),
        ),
      ),
    );
  }
}
