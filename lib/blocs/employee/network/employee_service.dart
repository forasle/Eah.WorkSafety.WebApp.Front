
import 'dart:convert';

import 'package:aeah_work_safety/blocs/employee/models/employee_request.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class EmployeeService extends BaseAPI {
  Future<EmployeeResponse> getEmployeeData(int page, int pageSize) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    http.Response employeeResponse = await http.get(Uri.parse(super.employeePath+"?pageNumber="+page.toString()+"&pageSize="+pageSize.toString()), headers: super.headers);
    final employeeResponseJson = jsonDecode(employeeResponse.body);
    final EmployeeResponse employeeResponseModel =EmployeeResponse.fromJson(employeeResponseJson);
    return employeeResponseModel;
  }
}
