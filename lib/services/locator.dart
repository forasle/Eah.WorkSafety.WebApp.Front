import 'package:aeah_work_safety/blocs/auth/network/auth_service.dart';
import 'package:aeah_work_safety/blocs/auth/repository/auth_repository.dart';
import 'package:aeah_work_safety/blocs/user/network/employee_service.dart';
import 'package:aeah_work_safety/blocs/user/network/statistic_service.dart';
import 'package:aeah_work_safety/blocs/user/network/user_service.dart';
import 'package:aeah_work_safety/blocs/user/repository/employee_repository.dart';
import 'package:aeah_work_safety/blocs/user/repository/statistic_repository.dart';
import 'package:aeah_work_safety/blocs/user/repository/user_repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => AuthRepository());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => EmployeeService());
  locator.registerLazySingleton(() => EmployeeRepository());
  locator.registerLazySingleton(() => StatisticService());
  locator.registerLazySingleton(() => StatisticRepository());
}
