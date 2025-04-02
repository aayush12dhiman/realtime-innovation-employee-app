// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Realtime Innovations';

  @override
  String get employeesList => 'Employee List';

  @override
  String get noEmployeeRecord => 'No employee records found';

  @override
  String get addEmployeeDetails => 'Add Employee Details';

  @override
  String get editEmployeeDetails => 'Edit Employee Details';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get undo => 'Undo';

  @override
  String get employeeDeleted => 'Employee data has been deleted';

  @override
  String get save => 'Save';

  @override
  String get currentEmployees => 'Current employees';

  @override
  String get previousEmployees => 'Previous employees';

  @override
  String get swipeLeft => 'Swipe left to delete or edit';

  @override
  String get confirmDelete => 'Confirm Delete';

  @override
  String get employeeName => 'Employee name';

  @override
  String get selectRole => 'Select role';

  @override
  String get today => 'Today';

  @override
  String get noDate => 'No date';

  @override
  String get required => 'Required field';

  @override
  String get invalidFromDate => 'Should be less than to date';

  @override
  String get invalidToDate => 'Should be greater than from date';

  @override
  String get nextMonday => 'Next Monday';

  @override
  String get nextTuesday => 'Next Tuesday';

  @override
  String get afterOneWeek => 'After 1 week';

  @override
  String get noDateSelected => 'Select some date';

  @override
  String fromDate(String date) {
    return 'From $date';
  }

  @override
  String fromAndToDate(String fromDate, String toDate) {
    return '$fromDate - $toDate';
  }

  @override
  String deleteEmployeeConfirmation(String name) {
    return 'Are you sure you want to delete $name';
  }
}
