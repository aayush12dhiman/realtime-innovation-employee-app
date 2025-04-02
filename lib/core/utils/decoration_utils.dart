import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtime_innovation_employee_app/core/theme/custom_colors.dart';

class CustomDecorators {
  late OutlineInputBorder _border, _errorBorder;
  late BuildContext _context;

  CustomDecorators(BuildContext context) {
    _context = context;
    _border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.sp),
      borderSide: BorderSide(color: CustomColors.platinumGrey, width: 1.sp),
    );
    _errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.sp),
      borderSide: BorderSide(color: CustomColors.fireRed, width: 1.sp),
    );
  }

  InputDecoration getInputDecoration({
    String? hintText,
    String? errorText,
    Widget? suffix,
    Widget? prefix,
    Color? fillColor,
    Color? borderColor,
    TextStyle? hintStyle,
    bool isReadOnly = false,
  }) {
    return InputDecoration(
      isDense: true,
      filled: true,
      fillColor: fillColor ?? Colors.transparent,
      errorText: errorText,
      counterText: '',
      contentPadding: EdgeInsets.symmetric(vertical: 14.h),
      hintText: hintText,
      hintStyle: Theme.of(
        _context,
      ).textTheme.displayLarge!.copyWith(color: CustomColors.spanishGrey),
      prefixIconConstraints:
          prefix == null ? null : BoxConstraints(maxWidth: 48.w),
      suffixIconConstraints:
          suffix == null ? null : BoxConstraints(maxWidth: 48.w),
      suffixIcon: suffix,
      prefixIcon: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0.w),
        child: prefix,
      ),
      errorStyle: Theme.of(
        _context,
      ).textTheme.displayMedium!.copyWith(color: CustomColors.fireRed),
      errorMaxLines: 2,
      focusedBorder: _border,
      focusedErrorBorder: _errorBorder,
      enabledBorder: _border,
      errorBorder: _errorBorder,
      disabledBorder: _border,
    );
  }
}
