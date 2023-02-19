
import 'package:aeah_work_safety/blocs/near_miss/models/near_miss.dart';
import 'package:aeah_work_safety/blocs/near_miss/models/near_miss_response.dart';
import 'package:aeah_work_safety/blocs/near_miss/models/create_near_miss_model.dart';
import 'package:aeah_work_safety/blocs/near_miss/models/update_near_miss_model.dart';
import 'package:aeah_work_safety/blocs/near_miss/network/near_miss_service.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:http/http.dart' as http;


class NearMissRepository {
  NearMissService nearMissService = locator<NearMissService>();

  Future<NearMissResponse> getNearMissData({required String page}) async {
    return await nearMissService.getNearMissData(page);
  }
  Future<NearMissResponse> getNearMissFiltered({required String page, required String filter}) async {
    return await nearMissService.getNearMissFiltered(page,filter);
  }
  Future<http.Response> createNearMiss({required CreateNearMissModel newNearMiss}) async {
    return await nearMissService.createNearMiss(newNearMiss);
  }
  Future<http.Response> updateNearMiss({required UpdateNearMissModel updatedNearMiss}) async {
    return await nearMissService.updateNearMiss(updatedNearMiss);
  }
  Future<NearMiss> getNearMissDataById({required int id}) async {
    return await nearMissService.getNearMissDataById(id);
  }
  Future<http.Response> deleteNearMiss({required int id}) async {
    return await nearMissService.deleteNearMiss(id);
  }
}
