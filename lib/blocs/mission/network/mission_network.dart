
import 'dart:convert';
import 'package:aeah_work_safety/blocs/mission/models/mission_response.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class MissionService extends BaseAPI {
  Future<MissionResponse> getMissionData(int page, int pageSize) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    var url = Uri.parse(super.missionPath+"?pageNumber="+page.toString()+"&pageSize="+pageSize.toString());
    http.Response missionResponse = await http.get(url,headers: super.headers);
    final missionResponseJson = jsonDecode(missionResponse.body);
    final MissionResponse missionResponseModel =MissionResponse.fromJson(missionResponseJson);
    return missionResponseModel;
  }

  Future<MissionResponse> getMissionFiltered(int page, int pageSize, String filter) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    http.Response missionResponse = await http.get(Uri.parse(super.missionSearchPath+filter+"&pageNumber="+page.toString()+"&pageSize="+pageSize.toString()), headers: super.headers);
    final missionResponseJson = jsonDecode(missionResponse.body);
    final MissionResponse missionResponseModel =MissionResponse.fromJson(missionResponseJson);
    return missionResponseModel;
  }
}
