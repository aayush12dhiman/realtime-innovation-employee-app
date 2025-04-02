import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtime_innovation_employee_app/core/theme/custom_colors.dart';

class CustomFab extends StatelessWidget {
  final String assetIcon;
  final VoidCallback onClick;

  const CustomFab({super.key, required this.assetIcon, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: CustomColors.primaryBlue,
          borderRadius: BorderRadius.circular(8.w),
        ),
        child: Image.asset(assetIcon, width: 18.w),
      ),
    );
  }
}
