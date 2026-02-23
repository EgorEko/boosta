import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconsButton extends StatelessWidget {
  const IconsButton({super.key, required this.icon, required this.onPressed});

  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: IconButton(onPressed: onPressed, icon: icon),
    );
  }
}
