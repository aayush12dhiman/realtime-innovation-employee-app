import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtime_innovation_employee_app/core/theme/custom_colors.dart';

class GetProgressIndicator extends StatelessWidget {
  const GetProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.pureBlack.withValues(alpha: 0.05),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.sp),
          child: SizedBox(
            height: 100.sp,
            width: 100.sp,
            child: Padding(
              padding: EdgeInsets.all(30.sp),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: CircularProgressIndicator(
                  color: CustomColors.primaryBlue,
                  strokeWidth: 2.sp,
                  backgroundColor: CustomColors.pureWhite,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
