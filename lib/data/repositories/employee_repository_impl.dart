import 'package:dartz/dartz.dart';
import 'package:realtime_innovation_employee_app/data/datasources/employees_datasource.dart';
import 'package:realtime_innovation_employee_app/data/models/employee_model.dart';
import 'package:realtime_innovation_employee_app/domain/entities/employee_entity.dart';
import 'package:realtime_innovation_employee_app/domain/repositories/employee_repository.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeesDataSource localDataSource;

  EmployeeRepositoryImpl(this.localDataSource);

  @override
  Future<Either<String, List<EmployeeEntity>>> getEmployees() async {
    return (await localDataSource.getEmployees()).fold(
      (l) => Left(l),
      (r) => Right(r.map((e) => e.toEntity()).toList()),
    );
  }

  @override
  Future<Either<String, void>> addEmployee(EmployeeEntity employee) async {
    return await localDataSource.addEmployee(
      EmployeeModel.fromEntity(employee),
    );
  }

  @override
  Future<Either<String, void>> editEmployee(EmployeeEntity employee) async {
    return await localDataSource.editEmployee(
      EmployeeModel.fromEntity(employee),
    );
  }

  @override
  Future<Either<String, void>> deleteEmployee(String id) async {
    return await localDataSource.deleteEmployee(id);
  }
}
