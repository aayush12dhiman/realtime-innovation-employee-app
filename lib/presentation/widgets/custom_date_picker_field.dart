import 'package:flutter/material.dart';
import 'package:realtime_innovation_employee_app/core/constants/constants.dart';
import 'package:realtime_innovation_employee_app/core/theme/custom_colors.dart';
import 'package:realtime_innovation_employee_app/core/utils/decoration_utils.dart';
import 'package:realtime_innovation_employee_app/core/utils/date_utils.dart'
    as du;
import 'package:realtime_innovation_employee_app/generated/app_localizations.dart';
import 'package:realtime_innovation_employee_app/presentation/widgets/custom_date_picker.dart';

class CustomDatePickerField extends FormField<DateTime?> {
  CustomDatePickerField({
    super.key,
    required BuildContext context,
    String? hint,
    String? prefixIcon,
    DateTime? minValue,
    bool allowDateAsNull = false,
    super.initialValue,
    super.validator,
    void Function(DateTime?)? onChanged,
  }) : super(
         autovalidateMode: AutovalidateMode.onUserInteraction,
         builder: (FormFieldState<DateTime?> state) {
           bool isSelectedDateToday =
               (state.value != null) &&
               (state.value ==
                   DateTime.now().copyWith(
                     hour: 0,
                     minute: 0,
                     second: 0,
                     microsecond: 0,
                     millisecond: 0,
                   ));

           return GestureDetector(
             onTap: () async {
               await showDialog(
                 context: context,
                 builder:
                     (context) => CustomDatePicker(
                       initialDate: state.value,
                       allowDateAsNull: allowDateAsNull,
                       minDate: minValue,
                       onDateSelected: (selectedValue) {
                         state.didChange(selectedValue);
                         onChanged?.call(selectedValue);
                       },
                     ),
               );
             },
             child: InputDecorator(
               decoration: CustomDecorators(context).getInputDecoration(
                 prefix: prefixIcon == null ? null : Image.asset(prefixIcon),
                 errorText: state.hasError ? state.errorText : null,
               ),
               child: Text(
                 (state.value == null)
                     ? (hint ?? '')
                     : isSelectedDateToday
                     ? AppLocalizations.of(context)!.today
                     : du.DateUtils.getStringFormattedDate(
                       date: state.value,
                       outputFormat: Constants.dateFormat3,
                     ),
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
}
