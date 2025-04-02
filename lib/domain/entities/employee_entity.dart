import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:realtime_innovation_employee_app/core/utils/date_utils.dart';
import 'package:realtime_innovation_employee_app/generated/app_localizations.dart';

part 'employee_entity.freezed.dart';

enum EmployeeType { current, previous }

@freezed
class EmployeeEntity with _$EmployeeEntity {
  const EmployeeEntity._();

  static EmployeeEntity initial() => EmployeeEntity(
    id: '',
    name: '',
    role: '',
    fromDate: DateTime.now().copyWith(
      hour: 0,
      minute: 0,
      second: 0,
      microsecond: 0,
      millisecond: 0,
    ),
  );

  const factory EmployeeEntity({
    required String id,
    required String name,
    required String role,
    required DateTime fromDate,
    DateTime? toDate,
    EmployeeType? employeeType,
  }) = _EmployeeEntity;

  String getDateToShow(BuildContext context) {
    if (toDate == null) {
      return AppLocalizations.of(
        context,
      )!.fromDate(DateUtils.getStringFormattedDate(date: fromDate));
    }

    return AppLocalizations.of(context)!.fromAndToDate(
      DateUtils.getStringFormattedDate(date: fromDate),
      DateUtils.getStringFormattedDate(date: toDate),
    );
  }
}
