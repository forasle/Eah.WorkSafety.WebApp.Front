
import 'dart:convert';
import 'package:aeah_work_safety/blocs/inconsistency/models/create_inconsistency_model.dart';
import 'package:aeah_work_safety/blocs/inconsistency/models/inconsistency.dart';
import 'package:aeah_work_safety/blocs/inconsistency/models/inconsistency_response.dart';
import 'package:aeah_work_safety/blocs/inconsistency/models/update_inconsistency_model.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class InconsistencyService extends BaseAPI {
  Future<InconsistencyResponse> getInconsistencyData(String page) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    var url = Uri.parse(page);
    http.Response inconsistencyResponse = await http.get(url,headers: super.headers);
    final inconsistencyResponseJson = jsonDecode(inconsistencyResponse.body);
    final InconsistencyResponse inconsistencyResponseModel =InconsistencyResponse.fromJson(inconsistencyResponseJson);
    return inconsistencyResponseModel;
  }

  Future<InconsistencyResponse> getInconsistencyFiltered(String page) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");
    headers["Authorization"]= "Bearer $token";
    http.Response inconsistencyResponse = await http.get(Uri.parse(page), headers: super.headers);
    final inconsistencyResponseJson = jsonDecode(inconsistencyResponse.body);
    final InconsistencyResponse inconsistencyResponseModel =InconsistencyResponse.fromJson(inconsistencyResponseJson);
    return inconsistencyResponseModel;
  }
  Future<http.Response> createInconsistency(CreateInconsistencyModel newInconsistency) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");
    headers["Authorization"]= "Bearer $token";
    http.Response createInconsistencyResponse = await http.post(Uri.parse(BaseAPI.inconsistencyPath),headers: super.headers,body: jsonEncode(newInconsistency));
    return createInconsistencyResponse;
  }
  Future<http.Response> updateInconsistency(UpdateInconsistencyModel updatedInconsistency) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");
    headers["Authorization"]= "Bearer $token";
    http.Response createInconsistencyResponse = await http.put(Uri.parse(BaseAPI.inconsistencyPath),headers: super.headers,body: jsonEncode(updatedInconsistency));
    return createInconsistencyResponse;
  }

  Future<Inconsistency> getInconsistencyDataById(int id) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    var url = Uri.parse(BaseAPI.inconsistencyPath+"/"+id.toString());
    http.Response inconsistency = await http.get(url, headers: super.headers);

    final inconsistencyJson = jsonDecode(inconsistency.body);
    final Inconsistency inconsistencyModel =Inconsistency.fromJson(inconsistencyJson);
    return inconsistencyModel;
  }

  Future<http.Response> deleteInconsistency(int id) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");
    headers["Authorization"]= "Bearer $token";
    http.Response deleteInconsistencyResponse = await http.delete(Uri.parse(BaseAPI.inconsistencyPath+"/"+id.toString()),headers: super.headers);
    return deleteInconsistencyResponse;
  }
}
