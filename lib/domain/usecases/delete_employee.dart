import 'package:dartz/dartz.dart';
import 'package:realtime_innovation_employee_app/core/usecase/base_usecase.dart';
import 'package:realtime_innovation_employee_app/domain/repositories/employee_repository.dart';

class DeleteEmployeeUseCase extends UseCase<Either<String, void>, String> {
  final EmployeeRepository repository;

  DeleteEmployeeUseCase(this.repository);

  @override
  Future<Either<String, void>> call(String id) async {
    return await repository.deleteEmployee(id);
  }
}
