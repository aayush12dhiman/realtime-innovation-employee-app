import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtime_innovation_employee_app/core/theme/custom_colors.dart';
import 'package:realtime_innovation_employee_app/core/utils/decoration_utils.dart';

typedef Validator = String? Function(String? value);

class CustomTextField extends StatefulWidget {
  final int maxLength;
  final int? maxLines;
  final Validator? validation;
  final TextInputType textInputType;
  final Function onValidate;
  final ValueChanged<String>? onTextChanged;
  final bool isReadOnly;
  final String? initialValue;
  final String? hint;
  final TextCapitalization textCapitalization;
  final TextEditingController? textEditingController;
  final String? prefixIcon;

  const CustomTextField({
    super.key,
    required this.maxLength,
    this.maxLines = 1,
    this.validation,
    required this.textInputType,
    required this.onValidate,
    this.isReadOnly = false,
    this.initialValue,
    this.onTextChanged,
    this.hint,
    this.textCapitalization = TextCapitalization.none,
    this.textEditingController,
    this.prefixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (widget.validation != null) {
          String? error = widget.validation!(value);
          if (error == null) return widget.onValidate(value);
          return error;
        }
        return widget.onValidate(value);
      },
      controller: widget.textEditingController,
      textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.displayLarge,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: widget.maxLines,
      cursorColor: CustomColors.primaryBlue,
      keyboardType: widget.textInputType,
      maxLength: widget.maxLength,
      readOnly: widget.isReadOnly,
      initialValue: widget.initialValue,
      enabled: !widget.isReadOnly,
      onChanged: widget.onTextChanged,
      textCapitalization: widget.textCapitalization,
      textAlignVertical: TextAlignVertical.center,
      decoration: CustomDecorators(context).getInputDecoration(
        hintText: widget.hint,
        isReadOnly: widget.isReadOnly,
        prefix:
            widget.prefixIcon == null ? null : Image.asset(widget.prefixIcon!),
      ),
    );
  }
}
