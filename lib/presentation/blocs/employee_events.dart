import 'package:equatable/equatable.dart';
import 'package:realtime_innovation_employee_app/domain/entities/employee_entity.dart';

abstract class EmployeeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetEmployees extends EmployeeEvent {}

class AddNewEmployee extends EmployeeEvent {
  final EmployeeEntity employee;

  AddNewEmployee(this.employee);

  @override
  List<Object> get props => [employee];
}

class EditEmployee extends EmployeeEvent {
  final EmployeeEntity employee;

  EditEmployee(this.employee);

  @override
  List<Object> get props => [employee];
}

class DeleteEmployee extends EmployeeEvent {
  final String id;

  DeleteEmployee(this.id);

  @override
  List<Object> get props => [id];
}
