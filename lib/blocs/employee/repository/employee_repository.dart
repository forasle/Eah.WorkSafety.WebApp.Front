
import 'package:aeah_work_safety/blocs/employee/models/employee.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:aeah_work_safety/blocs/employee/network/employee_service.dart';
import 'package:aeah_work_safety/services/locator.dart';


class EmployeeRepository {
  EmployeeService employeeService = locator<EmployeeService>();

  Future<EmployeeResponse> getEmployeeData({required String page}) async {
    return await employeeService.getEmployeeData(page);
  }
  Future<EmployeeResponse> getEmployeeFiltered({required String page,required String filter}) async {
    return await employeeService.getEmployeeFiltered(page,filter);
  }

  Future<Employee> getEmployeeDataById({required int id}) async {
    return await employeeService.getEmployeeDataById(id);
  }

  Future<EmployeeResponse> getEmployeeByIdentificationNumber({required String filter}) async {
    return await employeeService.getEmployeeByIdentificationNumber(filter);
  }
}
