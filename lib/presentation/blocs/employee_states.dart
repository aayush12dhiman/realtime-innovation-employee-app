import 'package:equatable/equatable.dart';
import 'package:realtime_innovation_employee_app/domain/entities/employee_entity.dart';

abstract class EmployeeState extends Equatable {
  @override
  List<Object> get props => [];
}

class EmployeeInitial extends EmployeeState {}

class EmployeeLoading extends EmployeeState {}

class EmployeeLoaded extends EmployeeState {
  final List<EmployeeEntity> employees;

  EmployeeLoaded(this.employees);

  bool get isNoEmployee => employees.isEmpty;

  @override
  List<Object> get props => [employees];
}

class EmployeeError extends EmployeeState {
  final String error;

  EmployeeError(this.error);

  @override
  List<Object> get props => [error];
}
