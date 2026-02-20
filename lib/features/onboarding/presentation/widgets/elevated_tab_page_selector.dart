import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class ShadowedTabPageSelector extends StatefulWidget {
  const ShadowedTabPageSelector({
    super.key,
    required this.controller,
    this.color = AppColors.white,
    this.selectedColor = AppColors.primaryColor,
  });

  final TabController controller;
  final Color color;
  final Color selectedColor;

  @override
  State<ShadowedTabPageSelector> createState() =>
      _ShadowedTabPageSelectorState();
}

class _ShadowedTabPageSelectorState extends State<ShadowedTabPageSelector> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_listener);
  }

  @override
  void didUpdateWidget(covariant ShadowedTabPageSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_listener);
      widget.controller.addListener(_listener);
    }
  }

  void _listener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = widget.controller.index;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.controller.length, (index) {
        final isSelected = index == currentIndex;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Container(
            width: 12.w,
            height: 12.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? widget.selectedColor : widget.color,
              boxShadow: isSelected
                  ? [BoxShadow(color: widget.color, offset: Offset(1.w, 1.h))]
                  : null,
            ),
          ),
        );
      }),
    );
  }
}
