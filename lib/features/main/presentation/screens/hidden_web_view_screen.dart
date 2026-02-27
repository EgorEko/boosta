import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/common/widgets/buttons/arrow_back_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../no_internet/presentation/screens/no_internet_screen.dart';

class HiddenWebViewScreen extends StatefulWidget {
  const HiddenWebViewScreen({super.key, required this.controller});

  final WebViewController controller;

  @override
  State<HiddenWebViewScreen> createState() => _HiddenWebViewScreenState();
}

class _HiddenWebViewScreenState extends State<HiddenWebViewScreen> {
  bool _isLoading = true;
  bool _isConnected = true;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    super.initState();

    _checkInitialConnectivity();

    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      _updateConnectionStatus(result);
    });

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
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> _checkInitialConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    _updateConnectionStatus(result);

    await Future.delayed(const Duration(milliseconds: 500));
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) {
    final bool hasInternet = !result.contains(ConnectivityResult.none);

    if (hasInternet && !_isConnected) {
      widget.controller.reload();
    }

    setState(() {
      _isConnected = hasInternet;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isConnected) {
      return NoInternetScreen(onPressed: _checkInitialConnectivity);
    }
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

            if (_isLoading && _isConnected)
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
    );
  }
}
