import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../utils/extensions.dart';

class BGWidget extends StatelessWidget {
  const BGWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth,
      height: context.getHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: AppColors.getGradient(),
        ),
      ),
      child: child,
    );
  }
}
