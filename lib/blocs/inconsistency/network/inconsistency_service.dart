
import 'dart:convert';
import 'package:aeah_work_safety/blocs/inconsistency/models/inconsistency_response.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class InconsistencyService extends BaseAPI {
  Future<InconsistencyResponse> getInconsistencyData(int page, int pageSize) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    var url = Uri.parse(super.inconsistencyPath+"?pageNumber="+page.toString()+"&pageSize="+pageSize.toString());
    http.Response inconsistencyResponse = await http.get(url,headers: super.headers);
    final inconsistencyResponseJson = jsonDecode(inconsistencyResponse.body);
    final InconsistencyResponse inconsistencyResponseModel =InconsistencyResponse.fromJson(inconsistencyResponseJson);
    return inconsistencyResponseModel;
  }

  Future<InconsistencyResponse> getInconsistencyFiltered(int page, int pageSize, String filter) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    http.Response inconsistencyResponse = await http.get(Uri.parse(super.inconsistencySearchPath+filter+"&pageNumber="+page.toString()+"&pageSize="+pageSize.toString()), headers: super.headers);
    final inconsistencyResponseJson = jsonDecode(inconsistencyResponse.body);
    final InconsistencyResponse inconsistencyResponseModel =InconsistencyResponse.fromJson(inconsistencyResponseJson);
    return inconsistencyResponseModel;
  }
}
