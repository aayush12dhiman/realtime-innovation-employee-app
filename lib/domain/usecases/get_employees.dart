import 'package:dartz/dartz.dart';
import 'package:realtime_innovation_employee_app/core/usecase/base_usecase.dart';
import 'package:realtime_innovation_employee_app/core/usecase/no_params.dart';
import 'package:realtime_innovation_employee_app/domain/entities/employee_entity.dart';
import 'package:realtime_innovation_employee_app/domain/repositories/employee_repository.dart';

class GetEmployeesUseCase
    extends UseCase<Either<String, List<EmployeeEntity>>, NoParams> {
  final EmployeeRepository repository;

  GetEmployeesUseCase(this.repository);

  @override
  Future<Either<String, List<EmployeeEntity>>> call(NoParams params) async {
    return await repository.getEmployees();
  }
}
