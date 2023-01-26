
import 'dart:convert';
import 'package:aeah_work_safety/blocs/preventive_activity/models/preventive_activity_response.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class PreventiveActivityService extends BaseAPI {
  Future<PreventiveActivityResponse> getPreventiveActivityData(int page, int pageSize) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    var url = Uri.parse(super.preventiveActivityPath+"?pageNumber="+page.toString()+"&pageSize="+pageSize.toString());
    http.Response preventiveActivityResponse = await http.get(url,headers: super.headers);
    final preventiveActivityResponseJson = jsonDecode(preventiveActivityResponse.body);
    final PreventiveActivityResponse preventiveActivityResponseModel =PreventiveActivityResponse.fromJson(preventiveActivityResponseJson);
    return preventiveActivityResponseModel;
  }

  Future<PreventiveActivityResponse> getPreventiveActivityFiltered(int page, int pageSize, String filter) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    http.Response preventiveActivityResponse = await http.get(Uri.parse(super.preventiveActivitySearchPath+filter+"&pageNumber="+page.toString()+"&pageSize="+pageSize.toString()), headers: super.headers);
    final preventiveActivityResponseJson = jsonDecode(preventiveActivityResponse.body);
    final PreventiveActivityResponse preventiveActivityResponseModel =PreventiveActivityResponse.fromJson(preventiveActivityResponseJson);
    return preventiveActivityResponseModel;
  }
}
