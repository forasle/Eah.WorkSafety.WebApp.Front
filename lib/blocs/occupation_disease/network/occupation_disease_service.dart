
import 'dart:convert';
import 'package:aeah_work_safety/blocs/chronic_disease/models/chronic_disease_response.dart';
import 'package:aeah_work_safety/blocs/occupation_disease/models/occupation_disease_response.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class OccupationDiseaseService extends BaseAPI {
  Future<OccupationDiseaseResponse> getOccupationDiseaseData(int page, int pageSize) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    var url = Uri.parse(super.occupationDiseasePath+"?pageNumber="+page.toString()+"&pageSize="+pageSize.toString());
    http.Response occupationDiseaseResponse = await http.get(url,headers: super.headers);
    final occupationDiseaseResponseJson = jsonDecode(occupationDiseaseResponse.body);
    final OccupationDiseaseResponse occupationDiseaseResponseModel =OccupationDiseaseResponse.fromJson(occupationDiseaseResponseJson);
    return occupationDiseaseResponseModel;
  }

  Future<OccupationDiseaseResponse> getOccupationDiseaseFiltered(int page, int pageSize, String filter) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    http.Response occupationDiseaseResponse = await http.get(Uri.parse(super.occupationDiseaseSearchPath+filter+"&pageNumber="+page.toString()+"&pageSize="+pageSize.toString()), headers: super.headers);
    final occupationDiseaseResponseJson = jsonDecode(occupationDiseaseResponse.body);
    final OccupationDiseaseResponse occupationDiseaseResponseModel =OccupationDiseaseResponse.fromJson(occupationDiseaseResponseJson);
    return occupationDiseaseResponseModel;
  }
}
