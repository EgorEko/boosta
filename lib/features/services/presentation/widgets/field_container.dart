import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class FieldContainer extends StatefulWidget {
  const FieldContainer({
    super.key,
    this.color = AppColors.black,
    this.bgColor = AppColors.primaryColor,
    this.isBordered = true,
    required this.title,
    required this.text,
    required this.child,
  });

  final String title;
  final Widget text;
  final Color color;
  final Color bgColor;
  final bool isBordered;
  final Widget child;

  @override
  State<FieldContainer> createState() => _FieldContainerState();
}

class _FieldContainerState extends State<FieldContainer> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: InkWell(
        onTap: _toggleExpand,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(40.r)),
            boxShadow: [
              BoxShadow(color: AppColors.black, offset: Offset(10.w, 10.h)),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        style: AppTextStyles.serviceTitleFont,
                        softWrap: true,
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      width: 36.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.bgColor,
                        border: widget.isBordered
                            ? BoxBorder.all(color: AppColors.black)
                            : null,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black,
                            offset: Offset(2.w, 2.h),
                          ),
                        ],
                      ),
                      child: AnimatedRotation(
                        duration: const Duration(milliseconds: 300),
                        turns: _isExpanded ? 0.25 : 0,
                        child: widget.child,
                      ),
                    ),
                  ],
                ),
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: widget.text,
                  ),
                  crossFadeState: _isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
