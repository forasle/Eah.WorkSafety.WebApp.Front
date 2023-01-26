
import 'package:aeah_work_safety/blocs/mission/models/mission_response.dart';
import 'package:aeah_work_safety/blocs/mission/network/mission_network.dart';
import 'package:aeah_work_safety/services/locator.dart';


class MissionRepository {
  MissionService missionService = locator<MissionService>();

  Future<MissionResponse> getMissionData({required int page,required int pageSize}) async {
    return await missionService.getMissionData(page,pageSize);
  }
  Future<MissionResponse> getMissionFiltered({required int page,required int pageSize,required String filter}) async {
    return await missionService.getMissionFiltered(page,pageSize,filter);
  }
}
