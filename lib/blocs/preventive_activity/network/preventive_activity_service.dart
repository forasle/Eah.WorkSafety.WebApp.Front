
import 'dart:convert';
import 'package:aeah_work_safety/blocs/preventive_activity/models/create_preventive_activity.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/models/preventive_activity.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/models/preventive_activity_response.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/models/update_preventive_activity.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class PreventiveActivityService extends BaseAPI {
  Future<PreventiveActivityResponse> getPreventiveActivityData(String page) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    var url = Uri.parse(page);
    http.Response preventiveActivityResponse = await http.get(url,headers: super.headers);
    final preventiveActivityResponseJson = jsonDecode(preventiveActivityResponse.body);
    final PreventiveActivityResponse preventiveActivityResponseModel =PreventiveActivityResponse.fromJson(preventiveActivityResponseJson);
    return preventiveActivityResponseModel;
  }

  Future<PreventiveActivityResponse> getPreventiveActivityFiltered(String page) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");
    headers["Authorization"]= "Bearer $token";
    http.Response preventiveActivityResponse = await http.get(Uri.parse(page), headers: super.headers);
    final preventiveActivityResponseJson = jsonDecode(preventiveActivityResponse.body);
    final PreventiveActivityResponse preventiveActivityResponseModel =PreventiveActivityResponse.fromJson(preventiveActivityResponseJson);
    return preventiveActivityResponseModel;
  }
  Future<http.Response> createPreventiveActivity(CreatePreventiveActivityModel newPreventiveActivity) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");
    headers["Authorization"]= "Bearer $token";
    http.Response createPreventiveActivityResponse = await http.post(Uri.parse(BaseAPI.preventiveActivityPath),headers: super.headers,body: jsonEncode(newPreventiveActivity));
    return createPreventiveActivityResponse;
  }
  Future<http.Response> updatePreventiveActivity(UpdatePreventiveActivityModel updatedPreventiveActivity) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");
    headers["Authorization"]= "Bearer $token";
    http.Response createPreventiveActivityResponse = await http.put(Uri.parse(BaseAPI.preventiveActivityPath),headers: super.headers,body: jsonEncode(updatedPreventiveActivity));
    return createPreventiveActivityResponse;
  }

  Future<PreventiveActivity> getPreventiveActivityDataById(int id) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    var url = Uri.parse(BaseAPI.preventiveActivityPath+"/"+id.toString());
    http.Response preventiveActivity = await http.get(url, headers: super.headers);

    final preventiveActivityJson = jsonDecode(preventiveActivity.body);
    final PreventiveActivity preventiveActivityModel =PreventiveActivity.fromJson(preventiveActivityJson);
    return preventiveActivityModel;
  }

  Future<http.Response> deletePreventiveActivity(int id) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");
    headers["Authorization"]= "Bearer $token";
    http.Response deletePreventiveActivityResponse = await http.delete(Uri.parse(BaseAPI.preventiveActivityPath+"/"+id.toString()),headers: super.headers);
    return deletePreventiveActivityResponse;
  }
}
