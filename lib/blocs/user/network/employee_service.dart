
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:http/http.dart' as http;

class EmployeeService extends BaseAPI {
  Future<http.Response> getEmployeeCount() async {
    http.Response employeeResponse = await http.get(Uri.parse(super.employeesPath), headers: super.headers);
    return employeeResponse;
  }
}
