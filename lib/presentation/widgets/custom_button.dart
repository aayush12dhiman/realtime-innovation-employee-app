import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtime_innovation_employee_app/core/theme/custom_colors.dart';

enum ButtonType { buttonPrimary, buttonOutlined }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final ButtonType buttonType;

  const CustomButton({
    super.key,
    required this.text,
    required this.onClick,
    this.buttonType = ButtonType.buttonPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: TextButton(
         style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.w),
          ),
          textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color:
                buttonType == ButtonType.buttonOutlined
                    ? CustomColors.primaryBlue
                    : CustomColors.pureWhite,
          ),
          backgroundColor:
              buttonType == ButtonType.buttonOutlined
                  ? CustomColors.blueLight
                  : CustomColors.primaryBlue,
        ),
        onPressed: onClick,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          child: Text(
            text,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color:
                  buttonType == ButtonType.buttonOutlined
                      ? CustomColors.primaryBlue
                      : CustomColors.pureWhite,
            ),
          ),
        ),
      ),
    );
  }
}
