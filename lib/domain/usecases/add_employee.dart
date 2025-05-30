import 'package:dartz/dartz.dart';
import 'package:realtime_innovation_employee_app/core/usecase/base_usecase.dart';
import 'package:realtime_innovation_employee_app/domain/entities/employee_entity.dart';
import 'package:realtime_innovation_employee_app/domain/repositories/employee_repository.dart';

class AddEmployeeUseCase extends UseCase<Either<String, void>, EmployeeEntity> {
  final EmployeeRepository repository;

  AddEmployeeUseCase(this.repository);

  @override
  Future<Either<String, void>> call(EmployeeEntity employee) async {
    return await repository.addEmployee(employee);
  }
}
