
import 'package:aeah_work_safety/blocs/accident/models/accident.dart';
import 'package:aeah_work_safety/blocs/accident/models/accident_response.dart';
import 'package:aeah_work_safety/blocs/accident/models/create_accident_model.dart';
import 'package:aeah_work_safety/blocs/accident/models/update_accident_model.dart';
import 'package:aeah_work_safety/blocs/accident/network/accident_service.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:http/http.dart' as http;


class AccidentRepository {
  AccidentService accidentService = locator<AccidentService>();

  Future<AccidentResponse> getAccidentData({required String page}) async {
    return await accidentService.getAccidentData(page);
  }
  Future<AccidentResponse> getAccidentFiltered({required String page}) async {
    return await accidentService.getAccidentFiltered(page);
  }
  Future<http.Response> createAccident({required CreateAccidentModel newAccident}) async {
    return await accidentService.createAccident(newAccident);
  }
  Future<http.Response> updateAccident({required UpdateAccidentModel updatedAccident}) async {
    return await accidentService.updateAccident(updatedAccident);
  }
  Future<Accident> getAccidentDataById({required int id}) async {
    return await accidentService.getAccidentDataById(id);
  }
  Future<http.Response> deleteAccident({required int id}) async {
    return await accidentService.deleteAccident(id);
  }
}
