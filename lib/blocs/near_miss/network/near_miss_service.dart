
import 'dart:convert';
import 'package:aeah_work_safety/blocs/near_miss/models/near_miss.dart';
import 'package:aeah_work_safety/blocs/near_miss/models/near_miss_response.dart';
import 'package:aeah_work_safety/blocs/near_miss/models/create_near_miss_model.dart';
import 'package:aeah_work_safety/blocs/near_miss/models/update_near_miss_model.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class NearMissService extends BaseAPI {
  Future<NearMissResponse> getNearMissData(String page) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    var url = Uri.parse(page);
    http.Response nearMissResponse = await http.get(url,headers: super.headers);
    final nearMissResponseJson = jsonDecode(nearMissResponse.body);
    final NearMissResponse nearMissResponseModel =NearMissResponse.fromJson(nearMissResponseJson);
    return nearMissResponseModel;
  }

  Future<NearMissResponse> getNearMissFiltered(String page, String filter) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    http.Response nearMissResponse = await http.get(Uri.parse(page), headers: super.headers);
    final nearMissResponseJson = jsonDecode(nearMissResponse.body);
    final NearMissResponse nearMissResponseModel =NearMissResponse.fromJson(nearMissResponseJson);
    return nearMissResponseModel;
  }
  Future<http.Response> createNearMiss(CreateNearMissModel newNearMiss) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");
    headers["Authorization"]= "Bearer $token";
    http.Response createNearMissResponse = await http.post(Uri.parse(BaseAPI.nearMissPath),headers: super.headers,body: jsonEncode(newNearMiss));
    return createNearMissResponse;
  }
  Future<http.Response> updateNearMiss(UpdateNearMissModel updatedNearMiss) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");
    headers["Authorization"]= "Bearer $token";
    http.Response createNearMissResponse = await http.put(Uri.parse(BaseAPI.nearMissPath),headers: super.headers,body: jsonEncode(updatedNearMiss));
    return createNearMissResponse;
  }

  Future<NearMiss> getNearMissDataById(int id) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    var url = Uri.parse(BaseAPI.nearMissPath+"/"+id.toString());
    http.Response nearMiss = await http.get(url, headers: super.headers);

    final nearMissJson = jsonDecode(nearMiss.body);
    final NearMiss nearMissModel =NearMiss.fromJson(nearMissJson);
    return nearMissModel;
  }

  Future<http.Response> deleteNearMiss(int id) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");
    headers["Authorization"]= "Bearer $token";
    http.Response deleteNearMissResponse = await http.delete(Uri.parse(BaseAPI.nearMissPath+"/"+id.toString()),headers: super.headers);
    return deleteNearMissResponse;
  }
}
