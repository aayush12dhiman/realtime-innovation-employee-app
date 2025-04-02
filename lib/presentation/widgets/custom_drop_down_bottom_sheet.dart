import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtime_innovation_employee_app/core/constants/assets.dart';
import 'package:realtime_innovation_employee_app/core/theme/custom_colors.dart';
import 'package:realtime_innovation_employee_app/core/utils/decoration_utils.dart';

class CustomDropdownBottomSheet extends FormField<String> {
  CustomDropdownBottomSheet({
    super.key,
    required List<String> items,
    required BuildContext context,
    String? hint,
    String? prefixIcon,
    super.initialValue,
    super.validator,
    void Function(String?)? onChanged,
  }) : super(
         autovalidateMode: AutovalidateMode.onUserInteraction,
         builder: (FormFieldState<String> state) {
           return GestureDetector(
             onTap: () async {
               String? selectedValue = await _showBottomSheet(
                 state.context,
                 items,
                 state.value,
               );
               if (selectedValue != null) {
                 state.didChange(selectedValue);
                 onChanged?.call(selectedValue);
               }
             },
             child: InputDecorator(
               decoration: CustomDecorators(context).getInputDecoration(
                 prefix: prefixIcon == null ? null : Image.asset(prefixIcon),
                 errorText: state.hasError ? state.errorText : null,
                 suffix: Padding(
                   padding: EdgeInsets.symmetric(
                     horizontal: 16.0.w,
                     vertical: 8.h,
                   ),
                   child: Image.asset(Assets.icDropdown, width: 11.67.w),
                 ),
               ),
               child: Text(
                 state.value ?? hint ?? '',
                 style: Theme.of(context).textTheme.displayLarge!.copyWith(
                   color:
                       (state.value == null)
                           ? CustomColors.spanishGrey
                           : CustomColors.jetGrey,
                 ),
               ),
             ),
           );
         },
       );

  static Future<String?> _showBottomSheet(
    BuildContext context,
    List<String> items,
    String? currentValue,
  ) async {
    return await showModalBottomSheet<String>(
      context: context,
      backgroundColor: CustomColors.pureWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.sp)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children:
              items
                  .map(
                    (item) => InkWell(
                      onTap: () => Navigator.pop(context, item),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1.sp,
                              color: CustomColors.antiFlashWhite,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.all(16.w),
                        child: Center(
                          child: Text(
                            item,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
        );
      },
    );
  }
}
