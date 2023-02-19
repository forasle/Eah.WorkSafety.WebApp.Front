
import 'package:aeah_work_safety/blocs/near_miss/models/update_near_miss_model.dart';
import 'package:aeah_work_safety/blocs/near_miss/repository/near_miss_repository.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:aeah_work_safety/blocs/employee/repository/employee_repository.dart';
import 'package:aeah_work_safety/constants/near_miss/constants.dart';
import 'package:aeah_work_safety/services/jwt_decoder.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'update_near_miss_event.dart';
part 'update_near_miss_state.dart';

class UpdateNearMissBloc extends Bloc<UpdateNearMissEvent, UpdateNearMissState> {
  final NearMissRepository _nearMissRepository = locator<NearMissRepository>();
  final EmployeeRepository _employeeRepository = locator<EmployeeRepository>();
  UpdateNearMissBloc() : super(const UpdateNearMissInitial()) {
    on<UpdateNearMiss>((event, emit) async {
      const storage = FlutterSecureStorage();
      final String? token = await storage.read(key: "token");
      var user = parseJwt(token!);

      var identificationNumber = event.identificationNumber;
      try{
        EmployeeResponse employeeFilteredById =
        await _employeeRepository.getEmployeeByIdentificationNumber(filter: identificationNumber);
        List<bool> sceneOfNearMissBoolList =
        stringListToBoolList(event.nearMiss["theSubjectOfTheNearMissStringList"], Constant.theSubjectOfTheNearMiss);
        List<bool> precautionsToBeTakenBoolList =
        stringListToBoolList(event.nearMiss["precautionsToBeTakenStringList"], Constant.precautionsToBeTaken);

        final UpdateNearMissModel _nearMiss;
        _nearMiss = UpdateNearMissModel(
          date: event.nearMiss["nearMissDate"],
          nearMissInfo: event.nearMiss["nearMissInfo"],
          performedJob: event.nearMiss["performedJob"],
          relatedDepartment: event.nearMiss["relatedDepartment"],
          referenceNumber: event.nearMiss["sceneOfNearMiss"],
          id: event.id,
          businessStopped: false,
          cameraRecording: false,
          creatorUserId: int.parse(user["id"]),
          duringOperation: false,
          eyewitnesses: false,
          eyewitnessesName: "Test",
          eyewitnessesPhoneNumber: "0",
          medicalIntervention: false,
          needFirstAid: false,
          propertyDamage: false,
          rootCauseAnalysis: false,
          witnessStatement: "Test",
          nearMissNumber: 0,
          updateAffectedEmployeeWithPropertyForNearMiss: [
            UpdateAffectedEmployeeWithPropertyForNearMiss(
                employeeId: employeeFilteredById.data[0].id,
                lostDays: int.parse(event.nearMiss["lostDay"]),
              thePrecautionsWorkingWithoutAuthorization: precautionsToBeTakenBoolList[0],
              thePrecautionsGiveOrReceiveFalseWarnings: precautionsToBeTakenBoolList[1],
              thePrecautionsErrorInSafety: precautionsToBeTakenBoolList[2],
              thePrecautionsImproperSpeed: precautionsToBeTakenBoolList[3],
              thePrecautionsNotUsingEquipmentProtectors: precautionsToBeTakenBoolList[4],
              thePrecautionsNotUsingPersonalProtectiveEquipment: precautionsToBeTakenBoolList[5],
              thePrecautionsEquipmentUsageError: precautionsToBeTakenBoolList[6],
              thePrecautionsUsingFaultyEquipment: precautionsToBeTakenBoolList[7],
              thePrecautionsWorkingInAnUnfamiliarField: precautionsToBeTakenBoolList[8],
              thePrecautionsDisobeyingInstructions: precautionsToBeTakenBoolList[9],
              thePrecautionsTirednessOrInsomniaOrDrowsiness: precautionsToBeTakenBoolList[10],
              thePrecautionsWorkingWithoutDiscipline: precautionsToBeTakenBoolList[11],
              thePrecautionsInsufficientMachineEquipmentEnclosure: precautionsToBeTakenBoolList[12],
              theSubjectExposureToPhysicalViolence: sceneOfNearMissBoolList[0],
              theSubjectExposureToVerbalViolence: sceneOfNearMissBoolList[1],
              theSubjectSharpObjectInjuries: sceneOfNearMissBoolList[2],
              theSubjectExposureToBiologicalAgents: sceneOfNearMissBoolList[3],
              theSubjectFallingImpactInjuries: sceneOfNearMissBoolList[4],
              theSubjectMaterialDamagedTrafficAccident: sceneOfNearMissBoolList[5],
              theSubjectInjuredTrafficAccident: sceneOfNearMissBoolList[6],
              theSubjectExposureToChemicals: sceneOfNearMissBoolList[7],
              theSubjectExposureToFireAndBurn: sceneOfNearMissBoolList[8],
              theSubjectOfficeAccidents: sceneOfNearMissBoolList[9],
              theSubjectElectricalAccidents: sceneOfNearMissBoolList[10],
                )
          ],
        );
        await _nearMissRepository.updateNearMiss(updatedNearMiss: _nearMiss);
        emit(const UpdateNearMissCompleted(message: "Kaza Güncellendi"));
        emit(const UpdateNearMissInitial());
      }
      catch(e) {
        emit(UpdateNearMissError(message: "Kaza güncellenemedi. Hata:  $e"));
      }

    }
    );
  }
  List<bool> stringListToBoolList(List<String> firstStringList, List<String> secondStringList) {
    List<bool> boolList = secondStringList.map((e) => firstStringList.toSet().contains(e)).toList();
    return boolList;

  }
}
