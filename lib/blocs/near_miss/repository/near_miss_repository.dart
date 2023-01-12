
import 'package:aeah_work_safety/blocs/near_miss/models/near_miss_response.dart';
import 'package:aeah_work_safety/blocs/near_miss/network/near_miss_service.dart';
import 'package:aeah_work_safety/services/locator.dart';


class NearMissRepository {
  NearMissService nearMissService = locator<NearMissService>();

  Future<NearMissResponse> getNearMissData({required int page,required int pageSize}) async {
    return await nearMissService.getNearMissData(page,pageSize);
  }
  Future<NearMissResponse> getNearMissFiltered({required int page,required int pageSize,required String filter}) async {
    return await nearMissService.getNearMissFiltered(page,pageSize,filter);
  }
}
