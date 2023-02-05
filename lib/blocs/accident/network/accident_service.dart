
import 'dart:convert';
import 'package:aeah_work_safety/blocs/accident/models/accident.dart';
import 'package:aeah_work_safety/blocs/accident/models/accident_response.dart';
import 'package:aeah_work_safety/blocs/accident/models/create_accident_model.dart';
import 'package:aeah_work_safety/blocs/accident/models/update_accident_model.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AccidentService extends BaseAPI {
  Future<AccidentResponse> getAccidentData(String page) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    var url = Uri.parse(page);
    http.Response accidentResponse = await http.get(url,headers: super.headers);
    final accidentResponseJson = jsonDecode(accidentResponse.body);
    final AccidentResponse accidentResponseModel =AccidentResponse.fromJson(accidentResponseJson);
    return accidentResponseModel;
  }

  Future<AccidentResponse> getAccidentFiltered(int page, int pageSize, String filter) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    http.Response accidentResponse = await http.get(Uri.parse(BaseAPI.accidentSearchPath+filter+"&pageNumber="+page.toString()+"&pageSize="+pageSize.toString()), headers: super.headers);
    final accidentResponseJson = jsonDecode(accidentResponse.body);
    final AccidentResponse accidentResponseModel =AccidentResponse.fromJson(accidentResponseJson);
    return accidentResponseModel;
  }
  Future<http.Response> createAccident(CreateAccidentModel newAccident) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");
    headers["Authorization"]= "Bearer $token";
    http.Response createAccidentResponse = await http.post(Uri.parse(BaseAPI.accidentPath),headers: super.headers,body: jsonEncode(newAccident));
    return createAccidentResponse;
  }
  Future<http.Response> updateAccident(UpdateAccidentModel updatedAccident) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");
    headers["Authorization"]= "Bearer $token";
    http.Response createAccidentResponse = await http.put(Uri.parse(BaseAPI.accidentPath),headers: super.headers,body: jsonEncode(updatedAccident));
    return createAccidentResponse;
  }

  Future<Accident> getAccidentDataById(int id) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    var url = Uri.parse(BaseAPI.accidentPath+"/"+id.toString());
    http.Response accident = await http.get(url, headers: super.headers);

    final accidentJson = jsonDecode(accident.body);
    final Accident accidentModel =Accident.fromJson(accidentJson);
    return accidentModel;
  }
}
