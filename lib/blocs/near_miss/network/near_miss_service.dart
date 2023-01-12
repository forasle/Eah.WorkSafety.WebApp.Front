
import 'dart:convert';
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
}
