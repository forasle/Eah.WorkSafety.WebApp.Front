
import 'package:aeah_work_safety/blocs/accident/accident_bloc.dart';
import 'package:aeah_work_safety/blocs/accident/models/accident_response.dart';
import 'package:aeah_work_safety/blocs/accident/models/create_accident_model.dart';
import 'package:aeah_work_safety/blocs/accident/network/accident_service.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:http/http.dart' as http;


class AccidentRepository {
  AccidentService accidentService = locator<AccidentService>();

  Future<AccidentResponse> getAccidentData({required int page,required int pageSize}) async {
    return await accidentService.getAccidentData(page,pageSize);
  }
  Future<AccidentResponse> getAccidentFiltered({required int page,required int pageSize,required String filter}) async {
    return await accidentService.getAccidentFiltered(page,pageSize,filter);
  }
  Future<EmployeeResponse> getEmployeeByIdentificationNumber({required String filter}) async {
    return await accidentService.getEmployeeByIdentificationNumber(filter);
  }
  Future<http.Response> createAccident({required CreateAccidentModel newAccident}) async {
    return await accidentService.createAccident(newAccident);
  }
}
