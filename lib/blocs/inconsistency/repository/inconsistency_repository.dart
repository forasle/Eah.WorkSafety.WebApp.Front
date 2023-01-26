
import 'package:aeah_work_safety/blocs/inconsistency/models/inconsistency_response.dart';
import 'package:aeah_work_safety/blocs/inconsistency/network/inconsistency_service.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:aeah_work_safety/blocs/employee/network/employee_service.dart';
import 'package:aeah_work_safety/services/locator.dart';


class InconsistencyRepository {
  InconsistencyService inconsistencyService = locator<InconsistencyService>();

  Future<InconsistencyResponse> getInconsistencyData({required int page,required int pageSize}) async {
    return await inconsistencyService.getInconsistencyData(page,pageSize);
  }
  Future<InconsistencyResponse> getInconsistencyFiltered({required int page,required int pageSize,required String filter}) async {
    return await inconsistencyService.getInconsistencyFiltered(page,pageSize,filter);
  }
}
