
import 'dart:convert';
import 'package:aeah_work_safety/blocs/accident/models/accident_response.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AccidentService extends BaseAPI {
  Future<AccidentResponse> getAccidentData(int page, int pageSize) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    var url = Uri.parse(super.accidentPath+"?pageNumber="+page.toString()+"&pageSize="+pageSize.toString());
    http.Response accidentResponse = await http.get(url,headers: super.headers);
    final accidentResponseJson = jsonDecode(accidentResponse.body);
    final AccidentResponse accidentResponseModel =AccidentResponse.fromJson(accidentResponseJson);
    return accidentResponseModel;
  }

  Future<AccidentResponse> getAccidentFiltered(int page, int pageSize, String filter) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    http.Response accidentResponse = await http.get(Uri.parse(super.accidentSearchPath+filter+"&pageNumber="+page.toString()+"&pageSize="+pageSize.toString()), headers: super.headers);
    final accidentResponseJson = jsonDecode(accidentResponse.body);
    final AccidentResponse accidentResponseModel =AccidentResponse.fromJson(accidentResponseJson);
    return accidentResponseModel;
  }
}
