
import 'package:aeah_work_safety/blocs/employee/models/employee_request.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:http/http.dart' as http;

class EmployeeService extends BaseAPI {
  Future<http.Response> getEmployeeData(int page, int pageSize, EmployeeRequest employeeRequest) async {
    var token = employeeRequest.loginResponse.token;
    headers["Authorization"]= "Bearer $token";
    http.Response employeeResponse = await http.get(Uri.parse(super.employeePath+"?pageNumber="+page.toString()+"&pageSize="+pageSize.toString()), headers: super.headers);
    return employeeResponse;
  }
}
