
import 'package:aeah_work_safety/blocs/preventive_activity/models/create_preventive_activity.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/models/preventive_activity.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/models/preventive_activity_response.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/models/update_preventive_activity.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/network/preventive_activity_service.dart';
import 'package:aeah_work_safety/services/locator.dart';

import 'package:http/http.dart' as http;

class PreventiveActivityRepository {
  PreventiveActivityService preventiveActivityService = locator<PreventiveActivityService>();

  Future<PreventiveActivityResponse> getPreventiveActivityData({required String page}) async {
    return await preventiveActivityService.getPreventiveActivityData(page);
  }
  Future<PreventiveActivityResponse> getPreventiveActivityFiltered({required String page}) async {
    return await preventiveActivityService.getPreventiveActivityFiltered(page);
  }
  Future<http.Response> createPreventiveActivity({required CreatePreventiveActivityModel newPreventiveActivity}) async {
    return await preventiveActivityService.createPreventiveActivity(newPreventiveActivity);
  }
  Future<http.Response> updatePreventiveActivity({required UpdatePreventiveActivityModel updatedPreventiveActivity}) async {
    return await preventiveActivityService.updatePreventiveActivity(updatedPreventiveActivity);
  }
  Future<PreventiveActivity> getPreventiveActivityDataById({required int id}) async {
    return await preventiveActivityService.getPreventiveActivityDataById(id);
  }
  Future<http.Response> deletePreventiveActivity({required int id}) async {
    return await preventiveActivityService.deletePreventiveActivity(id);
  }
}
