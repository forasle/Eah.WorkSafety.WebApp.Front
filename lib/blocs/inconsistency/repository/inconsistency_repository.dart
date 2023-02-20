
import 'package:aeah_work_safety/blocs/inconsistency/models/create_inconsistency_model.dart';
import 'package:aeah_work_safety/blocs/inconsistency/models/inconsistency.dart';
import 'package:aeah_work_safety/blocs/inconsistency/models/inconsistency_response.dart';
import 'package:aeah_work_safety/blocs/inconsistency/models/update_inconsistency_model.dart';
import 'package:aeah_work_safety/blocs/inconsistency/network/inconsistency_service.dart';
import 'package:aeah_work_safety/services/locator.dart';

import 'package:http/http.dart' as http;

class InconsistencyRepository {
  InconsistencyService inconsistencyService = locator<InconsistencyService>();

  Future<InconsistencyResponse> getInconsistencyData({required String page}) async {
    return await inconsistencyService.getInconsistencyData(page);
  }
  Future<InconsistencyResponse> getInconsistencyFiltered({required String page}) async {
    return await inconsistencyService.getInconsistencyFiltered(page);
  }
  Future<http.Response> createInconsistency({required CreateInconsistencyModel newInconsistency}) async {
    return await inconsistencyService.createInconsistency(newInconsistency);
  }
  Future<http.Response> updateInconsistency({required UpdateInconsistencyModel updatedInconsistency}) async {
    return await inconsistencyService.updateInconsistency(updatedInconsistency);
  }
  Future<Inconsistency> getInconsistencyDataById({required int id}) async {
    return await inconsistencyService.getInconsistencyDataById(id);
  }
  Future<http.Response> deleteInconsistency({required int id}) async {
    return await inconsistencyService.deleteInconsistency(id);
  }
}
