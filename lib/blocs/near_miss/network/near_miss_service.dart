
import 'dart:convert';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:aeah_work_safety/blocs/near_miss/models/create_near_miss_model.dart';
import 'package:aeah_work_safety/blocs/near_miss/models/near_miss_response.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class NearMissService extends BaseAPI {
  Future<NearMissResponse> getNearMissData(int page, int pageSize) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    var url = Uri.parse(super.nearMissPath+"?pageNumber="+page.toString()+"&pageSize="+pageSize.toString());
    http.Response nearMissResponse = await http.get(url,headers: super.headers);
    final nearMissResponseJson = jsonDecode(nearMissResponse.body);
    final NearMissResponse nearMissResponseModel =NearMissResponse.fromJson(nearMissResponseJson);
    return nearMissResponseModel;
  }

  Future<NearMissResponse> getNearMissFiltered(int page, int pageSize, String filter) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    http.Response nearMissResponse = await http.get(Uri.parse(super.nearMissSearchPath+filter+"&pageNumber="+page.toString()+"&pageSize="+pageSize.toString()), headers: super.headers);
    final nearMissResponseJson = jsonDecode(nearMissResponse.body);
    final NearMissResponse nearMissResponseModel =NearMissResponse.fromJson(nearMissResponseJson);
    return nearMissResponseModel;
  }

  Future<EmployeeResponse> getEmployeeByIdentificationNumber(String filter) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    http.Response employeeResponse = await http.get(Uri.parse(super.employeeSearchPath+filter+"&pageNumber="+1.toString()+"&pageSize="+10.toString()), headers: super.headers);
    final employeeResponseJson = jsonDecode(employeeResponse.body);
    final EmployeeResponse employeeResponseModel =EmployeeResponse.fromJson(employeeResponseJson);
    return employeeResponseModel;
  }
  Future<http.Response> createNearMiss(CreateNearMissModel newNearMiss) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");
    http.Response createNearMissResponse = await http.post(Uri.parse(super.nearMissPath),headers: super.headers,body: jsonEncode(newNearMiss));
    return createNearMissResponse;
  }
}
