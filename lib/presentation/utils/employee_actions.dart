import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_innovation_employee_app/core/services/dialog_service.dart';
import 'package:realtime_innovation_employee_app/core/services/snackbar_service.dart';
import 'package:realtime_innovation_employee_app/domain/entities/employee_entity.dart';
import 'package:realtime_innovation_employee_app/presentation/blocs/employee_bloc.dart';
import 'package:realtime_innovation_employee_app/presentation/blocs/employee_events.dart';

class EmployeeActions {
  EmployeeActions._();

  static void deleteEmployee(
    BuildContext context,
    EmployeeEntity employee, {
    VoidCallback? onDeletePerformed,
  }) {
    SnackBarService.hideSnackBarIfVisible(context: context);
    DialogService.showDeleteConfirmationDialog(
      context: context,
      employeeName: employee.name,
      onDeleteClicked: () {
        EmployeeBloc bloc = context.read<EmployeeBloc>();
        bloc.add(DeleteEmployee(employee.id));
        if (onDeletePerformed != null) {
          onDeletePerformed();
        }
        SnackBarService.showReversibleActionSnackBar(
          context: context,
          onUndoClicked: () {
            bloc.add(AddNewEmployee(employee));
          },
        );
      },
    );
  }
}
