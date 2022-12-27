
import 'package:aeah_work_safety/blocs/employee/models/employee_request.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:aeah_work_safety/blocs/user/models/user_request.dart';
import 'package:aeah_work_safety/blocs/employee/network/employee_service.dart';
import 'package:aeah_work_safety/blocs/user/network/user_service.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:http/http.dart';


class EmployeeRepository {
  EmployeeService employeeService = locator<EmployeeService>();

  Future<EmployeeResponse> getEmployeeData({required int page,required int pageSize}) async {
    return await employeeService.getEmployeeData(page,pageSize);
  }
}
