import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:realtime_innovation_employee_app/data/models/employee_model.dart';

class EmployeesDataSource {
  final Box<EmployeeModel> employeeBox;

  EmployeesDataSource(this.employeeBox);

  Future<Either<String, List<EmployeeModel>>> getEmployees() async {
    try {
      List<EmployeeModel> employees = employeeBox.values.toList();
      return Right(employees);
    } catch (e) {
      return Left("Error fetching employees: $e");
    }
  }

  Future<Either<String, void>> addEmployee(EmployeeModel employee) async {
    try {
      await employeeBox.put(employee.id, employee);
      return Right(null);
    } catch (e) {
      return Left("Error adding employee: $e");
    }
  }

  Future<Either<String, void>> editEmployee(EmployeeModel employee) async {
    if (!employeeBox.containsKey(employee.id)) {
      return Left("Error editing employee: Employee does not exist");
    }

    try {
      await employeeBox.put(employee.id, employee);
      return Right(null);
    } catch (e) {
      return Left("Error editing employee: $e");
    }
  }

  Future<Either<String, void>> deleteEmployee(String id) async {
    if (!employeeBox.containsKey(id)) {
      return Left("Error deleting employee: Employee does not exist");
    }

    try {
      await employeeBox.delete(id);
      return Right(null);
    } catch (e) {
      return Left("Error deleting employee: $e");
    }
  }
}
