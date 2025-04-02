import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Realtime Innovations'**
  String get title;

  /// No description provided for @employeesList.
  ///
  /// In en, this message translates to:
  /// **'Employee List'**
  String get employeesList;

  /// No description provided for @noEmployeeRecord.
  ///
  /// In en, this message translates to:
  /// **'No employee records found'**
  String get noEmployeeRecord;

  /// No description provided for @addEmployeeDetails.
  ///
  /// In en, this message translates to:
  /// **'Add Employee Details'**
  String get addEmployeeDetails;

  /// No description provided for @editEmployeeDetails.
  ///
  /// In en, this message translates to:
  /// **'Edit Employee Details'**
  String get editEmployeeDetails;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @employeeDeleted.
  ///
  /// In en, this message translates to:
  /// **'Employee data has been deleted'**
  String get employeeDeleted;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @currentEmployees.
  ///
  /// In en, this message translates to:
  /// **'Current employees'**
  String get currentEmployees;

  /// No description provided for @previousEmployees.
  ///
  /// In en, this message translates to:
  /// **'Previous employees'**
  String get previousEmployees;

  /// No description provided for @swipeLeft.
  ///
  /// In en, this message translates to:
  /// **'Swipe left to delete or edit'**
  String get swipeLeft;

  /// No description provided for @confirmDelete.
  ///
  /// In en, this message translates to:
  /// **'Confirm Delete'**
  String get confirmDelete;

  /// No description provided for @employeeName.
  ///
  /// In en, this message translates to:
  /// **'Employee name'**
  String get employeeName;

  /// No description provided for @selectRole.
  ///
  /// In en, this message translates to:
  /// **'Select role'**
  String get selectRole;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @noDate.
  ///
  /// In en, this message translates to:
  /// **'No date'**
  String get noDate;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required field'**
  String get required;

  /// No description provided for @invalidFromDate.
  ///
  /// In en, this message translates to:
  /// **'Should be less than to date'**
  String get invalidFromDate;

  /// No description provided for @invalidToDate.
  ///
  /// In en, this message translates to:
  /// **'Should be greater than from date'**
  String get invalidToDate;

  /// No description provided for @nextMonday.
  ///
  /// In en, this message translates to:
  /// **'Next Monday'**
  String get nextMonday;

  /// No description provided for @nextTuesday.
  ///
  /// In en, this message translates to:
  /// **'Next Tuesday'**
  String get nextTuesday;

  /// No description provided for @afterOneWeek.
  ///
  /// In en, this message translates to:
  /// **'After 1 week'**
  String get afterOneWeek;

  /// No description provided for @noDateSelected.
  ///
  /// In en, this message translates to:
  /// **'Select some date'**
  String get noDateSelected;

  /// No description provided for @fromDate.
  ///
  /// In en, this message translates to:
  /// **'From {date}'**
  String fromDate(String date);

  /// No description provided for @fromAndToDate.
  ///
  /// In en, this message translates to:
  /// **'{fromDate} - {toDate}'**
  String fromAndToDate(String fromDate, String toDate);

  /// No description provided for @deleteEmployeeConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {name}'**
  String deleteEmployeeConfirmation(String name);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
