import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_innovation_employee_app/core/usecase/no_params.dart';
import 'package:realtime_innovation_employee_app/domain/entities/employee_entity.dart';
import 'package:realtime_innovation_employee_app/domain/usecases/add_employee.dart';
import 'package:realtime_innovation_employee_app/domain/usecases/delete_employee.dart';
import 'package:realtime_innovation_employee_app/domain/usecases/edit_employee.dart';
import 'package:realtime_innovation_employee_app/domain/usecases/get_employees.dart';
import 'package:realtime_innovation_employee_app/presentation/blocs/employee_events.dart';
import 'package:realtime_innovation_employee_app/presentation/blocs/employee_states.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final GetEmployeesUseCase getEmployeesUseCase;
  final AddEmployeeUseCase addEmployeeUseCase;
  final EditEmployeeUseCase editEmployeeUseCase;
  final DeleteEmployeeUseCase deleteEmployeeUseCase;

  EmployeeBloc({
    required this.getEmployeesUseCase,
    required this.addEmployeeUseCase,
    required this.editEmployeeUseCase,
    required this.deleteEmployeeUseCase,
  }) : super(EmployeeInitial()) {
    on<GetEmployees>((event, emit) async {
      emit(EmployeeLoading());
      try {
        final employees = await getEmployeesUseCase(NoParams());

        employees.fold((l) => emit(EmployeeError(l)), (r) {
          /// I am separating current and previous employees based on this logic
          /// 1. If toDate is null means its current employee
          /// 2. If toDate is not null but is after today, means its current employee

          List<EmployeeEntity> allEmployees = [];
          DateTime today = DateTime.now().copyWith(
            hour: 0,
            minute: 0,
            second: 0,
            microsecond: 0,
            millisecond: 0,
          );
          for (EmployeeEntity emp in r) {
            EmployeeEntity updatedEmp;
            if (emp.toDate == null || !emp.toDate!.isBefore(today)) {
              updatedEmp = emp.copyWith(employeeType: EmployeeType.current);
            } else {
              updatedEmp = emp.copyWith(employeeType: EmployeeType.previous);
            }
            allEmployees.add(updatedEmp);
          }

          emit(EmployeeLoaded(allEmployees));
        });
      } catch (e) {
        emit(EmployeeError(e.toString()));
      }
    });

    on<AddNewEmployee>((event, emit) async {
      final result = await addEmployeeUseCase(event.employee);
      result.fold((l) => emit(EmployeeError(l)), (r) {
        ///once added, refresh the list
        add(GetEmployees());
      });
    });

    on<EditEmployee>((event, emit) async {
      final result = await editEmployeeUseCase(event.employee);
      result.fold((l) => emit(EmployeeError(l)), (r) {
        ///once added, refresh the list
        add(GetEmployees());
      });
    });

    on<DeleteEmployee>((event, emit) async {
      final result = await deleteEmployeeUseCase(event.id);
      result.fold((l) => emit(EmployeeError(l)), (r) {
        ///once added, refresh the list
        add(GetEmployees());
      });
    });
  }
}
