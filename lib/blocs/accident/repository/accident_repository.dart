
import 'package:aeah_work_safety/blocs/accident/models/accident_response.dart';
import 'package:aeah_work_safety/blocs/accident/network/accident_service.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:aeah_work_safety/blocs/employee/network/employee_service.dart';
import 'package:aeah_work_safety/services/locator.dart';


class AccidentRepository {
  AccidentService accidentService = locator<AccidentService>();

  Future<AccidentResponse> getAccidentData({required int page,required int pageSize}) async {
    return await accidentService.getAccidentData(page,pageSize);
  }
  Future<AccidentResponse> getAccidentFiltered({required int page,required int pageSize,required String filter}) async {
    return await accidentService.getAccidentFiltered(page,pageSize,filter);
  }
}
