
import 'package:aeah_work_safety/blocs/chronic_disease/models/chronic_disease_response.dart';
import 'package:aeah_work_safety/blocs/chronic_disease/network/chronic_disease_service.dart';
import 'package:aeah_work_safety/blocs/occupation_disease/models/occupation_disease_response.dart';
import 'package:aeah_work_safety/blocs/occupation_disease/network/occupation_disease_service.dart';
import 'package:aeah_work_safety/services/locator.dart';


class OccupationDiseaseRepository {
  OccupationDiseaseService occupationDiseaseService = locator<OccupationDiseaseService>();

  Future<OccupationDiseaseResponse> getOccupationDiseaseData({required int page,required int pageSize}) async {
    return await occupationDiseaseService.getOccupationDiseaseData(page,pageSize);
  }
  Future<OccupationDiseaseResponse> getOccupationDiseaseFiltered({required int page,required int pageSize,required String filter}) async {
    return await occupationDiseaseService.getOccupationDiseaseFiltered(page,pageSize,filter);
  }
}
