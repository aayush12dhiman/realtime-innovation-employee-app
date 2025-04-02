import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:realtime_innovation_employee_app/data/datasources/employees_datasource.dart';
import 'package:realtime_innovation_employee_app/data/models/employee_model.dart';
import 'package:realtime_innovation_employee_app/data/repositories/employee_repository_impl.dart';
import 'package:realtime_innovation_employee_app/domain/repositories/employee_repository.dart';
import 'package:realtime_innovation_employee_app/domain/usecases/add_employee.dart';
import 'package:realtime_innovation_employee_app/domain/usecases/delete_employee.dart';
import 'package:realtime_innovation_employee_app/domain/usecases/edit_employee.dart';
import 'package:realtime_innovation_employee_app/domain/usecases/get_employees.dart';
import 'package:realtime_innovation_employee_app/presentation/blocs/employee_bloc.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  ///hive
  sl.registerLazySingleton<Box<EmployeeModel>>(
    () => Hive.box<EmployeeModel>('employeesBox'),
  );

  ///data sources
  sl.registerLazySingleton<EmployeesDataSource>(
    () => EmployeesDataSource(sl<Box<EmployeeModel>>()),
  );

  ///repositories
  sl.registerLazySingleton<EmployeeRepository>(
    () => EmployeeRepositoryImpl(sl<EmployeesDataSource>()),
  );

  ///use cases
  sl.registerLazySingleton<GetEmployeesUseCase>(
    () => GetEmployeesUseCase(sl<EmployeeRepository>()),
  );
  sl.registerLazySingleton<AddEmployeeUseCase>(
    () => AddEmployeeUseCase(sl<EmployeeRepository>()),
  );
  sl.registerLazySingleton<EditEmployeeUseCase>(
    () => EditEmployeeUseCase(sl<EmployeeRepository>()),
  );
  sl.registerLazySingleton<DeleteEmployeeUseCase>(
    () => DeleteEmployeeUseCase(sl<EmployeeRepository>()),
  );

  ///bloc
  sl.registerFactory<EmployeeBloc>(
    () => EmployeeBloc(
      getEmployeesUseCase: sl<GetEmployeesUseCase>(),
      addEmployeeUseCase: sl<AddEmployeeUseCase>(),
      editEmployeeUseCase: sl<EditEmployeeUseCase>(),
      deleteEmployeeUseCase: sl<DeleteEmployeeUseCase>(),
    ),
  );
}
