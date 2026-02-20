import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'elevated_tab_page_selector.dart';

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return ShadowedTabPageSelector(
      controller: tabController,
      color: Colors.white,
      selectedColor: AppColors.primaryColor,
    );
  }
}
