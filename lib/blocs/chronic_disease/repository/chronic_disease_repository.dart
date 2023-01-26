
import 'package:aeah_work_safety/blocs/chronic_disease/models/chronic_disease_response.dart';
import 'package:aeah_work_safety/blocs/chronic_disease/network/chronic_disease_service.dart';
import 'package:aeah_work_safety/services/locator.dart';


class ChronicDiseaseRepository {
  ChronicDiseaseService chronicDiseaseService = locator<ChronicDiseaseService>();

  Future<ChronicDiseaseResponse> getChronicDiseaseData({required int page,required int pageSize}) async {
    return await chronicDiseaseService.getChronicDiseaseData(page,pageSize);
  }
  Future<ChronicDiseaseResponse> getChronicDiseaseFiltered({required int page,required int pageSize,required String filter}) async {
    return await chronicDiseaseService.getChronicDiseaseFiltered(page,pageSize,filter);
  }
}
