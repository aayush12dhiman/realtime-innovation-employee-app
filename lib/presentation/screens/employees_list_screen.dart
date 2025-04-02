import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_innovation_employee_app/core/constants/assets.dart';
import 'package:realtime_innovation_employee_app/core/services/dialog_service.dart';
import 'package:realtime_innovation_employee_app/core/services/snackbar_service.dart';
import 'package:realtime_innovation_employee_app/core/theme/custom_colors.dart';
import 'package:realtime_innovation_employee_app/generated/app_localizations.dart';
import 'package:realtime_innovation_employee_app/presentation/blocs/employee_bloc.dart';
import 'package:realtime_innovation_employee_app/presentation/blocs/employee_states.dart';
import 'package:realtime_innovation_employee_app/presentation/screens/add_edit_employee_screen.dart';
import 'package:realtime_innovation_employee_app/presentation/widgets/custom_fab.dart';
import 'package:realtime_innovation_employee_app/presentation/widgets/default_appbar.dart';
import 'package:realtime_innovation_employee_app/presentation/widgets/employees_list.dart';
import 'package:realtime_innovation_employee_app/presentation/widgets/no_employees_available.dart';
import 'package:realtime_innovation_employee_app/presentation/widgets/progress_indicator.dart';

class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: AppLocalizations.of(context)!.employeesList),
      backgroundColor: CustomColors.antiFlashWhite,
      body: BlocConsumer<EmployeeBloc, EmployeeState>(
        buildWhen: (previous, current) {
          return (current is! EmployeeError);
        },
        builder: (context, state) {
          return (state is EmployeeLoading)
              ? GetProgressIndicator()
              : (state is EmployeeLoaded)
              ? (state.isNoEmployee
                  ? NoEmployeesAvailable()
                  : EmployeesList(employees: state.employees))
              : Container();
        },
        listener: (context, state) {
          if (state is EmployeeError) {
            SnackBarService.showSnackBar(
              context: context,
              message: state.error,
            );
          }
        },
      ),
      floatingActionButton: CustomFab(
        assetIcon: Assets.icPlus,
        onClick: () {
          if(kIsWeb){
            DialogService.showSideDialog(context, AddEditEmployeeScreen());
            return;
          }
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddEditEmployeeScreen()),
          );
        },
      ),
    );
  }
}
