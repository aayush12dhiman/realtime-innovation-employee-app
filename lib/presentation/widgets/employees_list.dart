import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:realtime_innovation_employee_app/core/services/dialog_service.dart';
import 'package:realtime_innovation_employee_app/core/services/snackbar_service.dart';
import 'package:realtime_innovation_employee_app/core/theme/custom_colors.dart';
import 'package:realtime_innovation_employee_app/domain/entities/employee_entity.dart';
import 'package:realtime_innovation_employee_app/generated/app_localizations.dart';
import 'package:realtime_innovation_employee_app/presentation/blocs/employee_bloc.dart';
import 'package:realtime_innovation_employee_app/presentation/blocs/employee_events.dart';
import 'package:realtime_innovation_employee_app/presentation/screens/add_edit_employee_screen.dart';
import 'package:realtime_innovation_employee_app/presentation/utils/employee_actions.dart';

class EmployeesList extends StatelessWidget {
  final List<EmployeeEntity> employees;

  const EmployeesList({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SlidableAutoCloseBehavior(
            child: GroupedListView<EmployeeEntity, String>(
              elements: employees,
              groupBy:
                  (EmployeeEntity element) =>
                      (element.employeeType == EmployeeType.current)
                          ? AppLocalizations.of(context)!.currentEmployees
                          : AppLocalizations.of(context)!.previousEmployees,
              groupComparator: (value1, value2) => value1.compareTo(value2),
              groupSeparatorBuilder:
                  (String groupByValue) =>
                      _getGroupSeparator(groupByValue, context),
              itemComparator:
                  (item1, item2) => item1.fromDate.compareTo(item2.fromDate),
              itemBuilder:
                  (context, EmployeeEntity element) =>
                      _getEmployeeItem(element, context),
              separator: SizedBox(height: 0.5.sp, width: double.infinity),
              useStickyGroupSeparators: true,
            ),
          ),
        ),
        _getFooterSection(context),
      ],
    );
  }

  Widget _getGroupSeparator(String groupByValue, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      child: Text(groupByValue, style: Theme.of(context).textTheme.labelMedium),
    );
  }

  Widget _getFooterSection(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 12.h,
          bottom: 45.h,
        ),
        child: Text(
          AppLocalizations.of(context)!.swipeLeft,
          style: Theme.of(
            context,
          ).textTheme.labelSmall!.copyWith(fontSize: 15.h),
        ),
      ),
    );
  }

  Widget _getEmployeeItem(EmployeeEntity element, BuildContext context) {
    return Slidable(
      key: ValueKey(element.id),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            onPressed: (_) => EmployeeActions.deleteEmployee(context, element),
            backgroundColor: CustomColors.fireRed,
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
          SlidableAction(
            onPressed: (_) => _editEmployee(context, element),
            backgroundColor: CustomColors.primaryBlue,
            foregroundColor: Colors.white,
            icon: Icons.edit,
          ),
        ],
      ),
      child: Container(
        width: double.infinity,
        color: CustomColors.pureWhite,
        padding: EdgeInsets.all(16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              element.name,
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(color: CustomColors.jetGrey),
            ),
            Gap(6.h),
            Text(element.role, style: Theme.of(context).textTheme.labelSmall),
            Gap(6.h),
            Text(
              element.getDateToShow(context),
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }

  void _editEmployee(BuildContext context, EmployeeEntity employee) {
    if (kIsWeb) {
      DialogService.showSideDialog(
        context,
        AddEditEmployeeScreen(employeeEntity: employee),
      );
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddEditEmployeeScreen(employeeEntity: employee),
      ),
    );
  }
}
