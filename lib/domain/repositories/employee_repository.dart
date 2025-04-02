import 'package:dartz/dartz.dart';
import 'package:realtime_innovation_employee_app/domain/entities/employee_entity.dart';

abstract class EmployeeRepository {
  Future<Either<String, List<EmployeeEntity>>> getEmployees();

  Future<Either<String, void>> addEmployee(EmployeeEntity employee);

  Future<Either<String, void>> editEmployee(EmployeeEntity employee);

  Future<Either<String, void>> deleteEmployee(String id);
}
