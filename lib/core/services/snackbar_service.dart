import 'package:flutter/material.dart';
import 'package:realtime_innovation_employee_app/core/theme/custom_colors.dart';
import 'package:realtime_innovation_employee_app/generated/app_localizations.dart';
import 'package:realtime_innovation_employee_app/main.dart';

class SnackBarService {
  SnackBarService._();

  static showReversibleActionSnackBar({
    required BuildContext context,
    required VoidCallback onUndoClicked,
  }) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: CustomColors.jetGrey,
        content: Text(
          localizations.employeeDeleted,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: localizations.undo,
          textColor: CustomColors.primaryBlue,
          onPressed: onUndoClicked,
        ),
      ),
    );
  }

  static showSnackBar({
    required BuildContext context,
    required String message,
  }) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: CustomColors.pureWhite,
        content: Text(
          message,
          style: Theme.of(
            context,
          ).textTheme.displayMedium!.copyWith(color: CustomColors.fireRed),
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

  static hideSnackBarIfVisible({required BuildContext context}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
