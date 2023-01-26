
import 'package:aeah_work_safety/blocs/preventive_activity/models/preventive_activity_response.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/network/preventive_activity_service.dart';
import 'package:aeah_work_safety/services/locator.dart';


class PreventiveActivityRepository {
  PreventiveActivityService preventiveActivityService = locator<PreventiveActivityService>();

  Future<PreventiveActivityResponse> getPreventiveActivityData({required int page,required int pageSize}) async {
    return await preventiveActivityService.getPreventiveActivityData(page,pageSize);
  }
  Future<PreventiveActivityResponse> getPreventiveActivityFiltered({required int page,required int pageSize,required String filter}) async {
    return await preventiveActivityService.getPreventiveActivityFiltered(page,pageSize,filter);
  }
}
