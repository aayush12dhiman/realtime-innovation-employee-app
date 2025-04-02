import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:realtime_innovation_employee_app/core/constants/assets.dart';
import 'package:realtime_innovation_employee_app/core/constants/constants.dart';
import 'package:realtime_innovation_employee_app/domain/entities/employee_entity.dart';
import 'package:realtime_innovation_employee_app/generated/app_localizations.dart';
import 'package:collection/collection.dart';
import 'package:realtime_innovation_employee_app/presentation/blocs/employee_bloc.dart';
import 'package:realtime_innovation_employee_app/presentation/blocs/employee_events.dart';
import 'package:realtime_innovation_employee_app/presentation/utils/employee_actions.dart';
import 'package:realtime_innovation_employee_app/presentation/widgets/bottom_navigation_wrapper.dart';
import 'package:realtime_innovation_employee_app/presentation/widgets/custom_button.dart';
import 'package:realtime_innovation_employee_app/presentation/widgets/custom_date_picker_field.dart';
import 'package:realtime_innovation_employee_app/presentation/widgets/custom_drop_down_bottom_sheet.dart';
import 'package:realtime_innovation_employee_app/presentation/widgets/custom_text_field.dart';
import 'package:realtime_innovation_employee_app/presentation/widgets/default_appbar.dart';

class AddEditEmployeeScreen extends StatefulWidget {
  final EmployeeEntity? employeeEntity;

  const AddEditEmployeeScreen({super.key, this.employeeEntity});

  @override
  State<AddEditEmployeeScreen> createState() => _AddEditEmployeeScreenState();
}

class _AddEditEmployeeScreenState extends State<AddEditEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  AppLocalizations? _appLocalizations;
  EmployeeEntity _employeeEntity = EmployeeEntity.initial();

  bool get _isEdit => widget.employeeEntity != null;
  bool _isFirstTime = true;

  @override
  void didChangeDependencies() {
    if (_isFirstTime) {
      _isFirstTime = false;
      if (_isEdit) {
        _employeeEntity = widget.employeeEntity!;
        Future.delayed(Duration.zero, () {
          setState(() {});
        });
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _appLocalizations ??= AppLocalizations.of(context)!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: DefaultAppBar(
        title:
            _isEdit
                ? _appLocalizations!.editEmployeeDetails
                : _appLocalizations!.addEmployeeDetails,
        actions:
            _isEdit
                ? [
                  IconButton(
                    onPressed: () {
                      EmployeeActions.deleteEmployee(
                        context,
                        widget.employeeEntity!,
                        onDeletePerformed: () {
                          Navigator.of(context).pop();
                        },
                      );
                    },
                    icon: Image.asset(Assets.icDelete, width: 24.w),
                  ),
                ]
                : null,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Column(
                children: [
                  Gap(24.h),
                  CustomTextField(
                    maxLength: 50,
                    textInputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    maxLines: 1,
                    initialValue: _employeeEntity.name,
                    prefixIcon: Assets.icPerson,
                    hint: _appLocalizations!.employeeName,
                    onValidate: (String? value) {
                      if ((value ?? '').trim().isEmpty) {
                        return _appLocalizations!.required;
                      }
                      _employeeEntity = _employeeEntity.copyWith(
                        name: value ?? '',
                      );
                      return null;
                    },
                  ),
                  Gap(24.h),
                  CustomDropdownBottomSheet(
                    context: context,
                    items: Constants.allRoles,
                    hint: _appLocalizations!.selectRole,
                    prefixIcon: Assets.icRole,
                    initialValue: Constants.allRoles.firstWhereOrNull(
                      (element) => element == _employeeEntity.role,
                    ),
                    onChanged: (String? value) {
                      _employeeEntity = _employeeEntity.copyWith(
                        role: value ?? '',
                      );
                    },
                    validator: (String? value) {
                      if ((value ?? '').trim().isEmpty) {
                        return _appLocalizations!.required;
                      }
                      return null;
                    },
                  ),
                  Gap(24.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomDatePickerField(
                          context: context,
                          prefixIcon: Assets.icDate,
                          hint: _appLocalizations!.noDate,
                          initialValue: _employeeEntity.fromDate,
                          validator: (DateTime? value) {
                            if (value == null) {
                              return _appLocalizations!.required;
                            } else if (_employeeEntity.toDate != null &&
                                _employeeEntity.toDate!.isBefore(value)) {
                              return _appLocalizations!.invalidFromDate;
                            }
                            return null;
                          },
                          onChanged: (DateTime? value) {
                            if (value == null) {
                              return;
                            }
                            _employeeEntity = _employeeEntity.copyWith(
                              fromDate: value,
                            );
                            setState(() {});
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 10.w,
                        ),
                        child: Image.asset(Assets.icArrowTo, width: 20.w),
                      ),
                      Expanded(
                        child: CustomDatePickerField(
                          context: context,
                          prefixIcon: Assets.icDate,
                          allowDateAsNull: true,
                          minValue: _employeeEntity.fromDate,
                          initialValue: _employeeEntity.toDate,
                          hint: _appLocalizations!.noDate,
                          validator: (DateTime? value) {
                            if (value != null &&
                                value.isBefore(_employeeEntity.fromDate)) {
                              return _appLocalizations!.invalidToDate;
                            }
                            return null;
                          },
                          onChanged: (DateTime? value) {
                            _employeeEntity = _employeeEntity.copyWith(
                              toDate: value,
                            );
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            BottomNavigationWrapper(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    text: _appLocalizations!.cancel,
                    onClick: () {
                      Navigator.of(context).pop();
                    },
                    buttonType: ButtonType.buttonOutlined,
                  ),
                  Gap(16.w),
                  CustomButton(
                    text: _appLocalizations!.save,
                    onClick: () {
                      _validateData();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _validateData() async {
    if (!_formKey.currentState!.validate()) return;

    if (!mounted) return;

    if (!_isEdit) {
      _employeeEntity = _employeeEntity.copyWith(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
      );
      context.read<EmployeeBloc>().add(AddNewEmployee(_employeeEntity));
    } else {
      context.read<EmployeeBloc>().add(EditEmployee(_employeeEntity));
    }
    Navigator.of(context).pop();
  }
}
