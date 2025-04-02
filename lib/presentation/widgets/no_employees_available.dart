import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtime_innovation_employee_app/core/constants/assets.dart';
import 'package:realtime_innovation_employee_app/core/theme/custom_colors.dart';
import 'package:realtime_innovation_employee_app/generated/app_localizations.dart';

class NoEmployeesAvailable extends StatelessWidget {
  const NoEmployeesAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: CustomColors.antiFlashWhite,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Assets.noEmployee, width: 261.w),
            Text(
              AppLocalizations.of(context)!.noEmployeeRecord,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: CustomColors.jetGrey),
            ),
          ],
        ),
      ),
    );
  }
}
