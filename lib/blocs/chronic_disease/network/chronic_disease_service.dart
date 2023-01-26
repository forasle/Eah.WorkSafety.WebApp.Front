
import 'dart:convert';
import 'package:aeah_work_safety/blocs/chronic_disease/models/chronic_disease_response.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ChronicDiseaseService extends BaseAPI {
  Future<ChronicDiseaseResponse> getChronicDiseaseData(int page, int pageSize) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    var url = Uri.parse(super.chronicDiseasePath+"?pageNumber="+page.toString()+"&pageSize="+pageSize.toString());
    http.Response chronicDiseaseResponse = await http.get(url,headers: super.headers);
    final chronicDiseaseResponseJson = jsonDecode(chronicDiseaseResponse.body);
    final ChronicDiseaseResponse chronicDiseaseResponseModel =ChronicDiseaseResponse.fromJson(chronicDiseaseResponseJson);
    return chronicDiseaseResponseModel;
  }

  Future<ChronicDiseaseResponse> getChronicDiseaseFiltered(int page, int pageSize, String filter) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    http.Response chronicDiseaseResponse = await http.get(Uri.parse(super.chronicDiseaseSearchPath+filter+"&pageNumber="+page.toString()+"&pageSize="+pageSize.toString()), headers: super.headers);
    final chronicDiseaseResponseJson = jsonDecode(chronicDiseaseResponse.body);
    final ChronicDiseaseResponse chronicDiseaseResponseModel =ChronicDiseaseResponse.fromJson(chronicDiseaseResponseJson);
    return chronicDiseaseResponseModel;
  }
}
