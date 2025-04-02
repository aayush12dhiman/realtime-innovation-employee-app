import 'package:hive/hive.dart';
import 'package:realtime_innovation_employee_app/domain/entities/employee_entity.dart';

part 'employee_model.g.dart';

@HiveType(typeId: 0)
class EmployeeModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String role;

  @HiveField(3)
  DateTime fromDate;

  @HiveField(4)
  DateTime? toDate;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.role,
    required this.fromDate,
    required this.toDate,
  });

  factory EmployeeModel.fromEntity(EmployeeEntity employee) {
    return EmployeeModel(
      id: employee.id,
      name: employee.name,
      role: employee.role,
      fromDate: employee.fromDate,
      toDate: employee.toDate,
    );
  }

  EmployeeEntity toEntity() {
    return EmployeeEntity(
      id: id,
      name: name,
      role: role,
      fromDate: fromDate,
      toDate: toDate,
    );
  }
}
