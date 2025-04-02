import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realtime_innovation_employee_app/core/theme/custom_colors.dart';
import 'package:realtime_innovation_employee_app/generated/app_localizations.dart';

class DialogService {
  DialogService._();

  static void showDeleteConfirmationDialog({
    required BuildContext context,
    String? employeeName,
    required VoidCallback onDeleteClicked,
  }) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    showCupertinoDialog(
      context: context,
      builder:
          (_) => CupertinoAlertDialog(
            title: Text(localizations.confirmDelete),
            content: Text(
              localizations.deleteEmployeeConfirmation(employeeName ?? ''),
            ),
            actions: [
              CupertinoDialogAction(
                child: Text(localizations.cancel),
                onPressed: () => Navigator.pop(context),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: Text(localizations.delete),
                onPressed: () {
                  Navigator.pop(context);
                  onDeleteClicked();
                },
              ),
            ],
          ),
    );
  }

  static void showSideDialog(BuildContext context, Widget child) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.centerRight,
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: CustomColors.pureWhite,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(-4, 0),
                  ),
                ],
              ),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
