import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtime_innovation_employee_app/core/theme/custom_colors.dart';

class BottomNavigationWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;

  const BottomNavigationWrapper({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: CustomColors.antiFlashWhite, width: 2.h),
        ),
      ),
      child: child,
    );
  }
}
