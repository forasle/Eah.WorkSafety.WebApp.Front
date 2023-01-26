
import 'dart:convert';
import 'package:aeah_work_safety/blocs/employee/models/employee.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class EmployeeService extends BaseAPI {
  Future<EmployeeResponse> getEmployeeData(int page, int pageSize) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    var url = Uri.parse(super.employeePath+"?pageNumber="+page.toString()+"&pageSize="+pageSize.toString());
    http.Response employeeResponse = await http.get(url,headers: super.headers);
    final employeeResponseJson = jsonDecode(employeeResponse.body);
    final EmployeeResponse employeeResponseModel =EmployeeResponse.fromJson(employeeResponseJson);
    return employeeResponseModel;
  }

  Future<EmployeeResponse> getEmployeeFiltered(int page, int pageSize, String filter) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    http.Response employeeResponse = await http.get(Uri.parse(super.employeeSearchPath+filter+"&pageNumber="+page.toString()+"&pageSize="+pageSize.toString()), headers: super.headers);
    final employeeResponseJson = jsonDecode(employeeResponse.body);
    final EmployeeResponse employeeResponseModel =EmployeeResponse.fromJson(employeeResponseJson);
    return employeeResponseModel;
  }

  Future<Employee> getEmployeeDataById(int id) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    http.Response employeeResponse = await http.get(Uri.parse(super.employeePath+"/"+id.toString()), headers: super.headers);
    final employeeJson = jsonDecode(employeeResponse.body);
    final Employee employeeModel =Employee.fromJson(employeeJson);
    return employeeModel;
  }
}
