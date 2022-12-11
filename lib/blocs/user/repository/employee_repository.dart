
import 'package:aeah_work_safety/blocs/user/models/user_request.dart';
import 'package:aeah_work_safety/blocs/user/network/employee_service.dart';
import 'package:aeah_work_safety/blocs/user/network/user_service.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:http/http.dart';


class EmployeeRepository {
  EmployeeService employeeService = locator<EmployeeService>();

  Future<Response> getEmployeeCount() async {
    return await employeeService.getEmployeeCount();
  }
}
