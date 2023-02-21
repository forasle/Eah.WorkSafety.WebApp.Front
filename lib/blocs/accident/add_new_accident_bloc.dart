import 'package:aeah_work_safety/blocs/accident/models/create_accident_model.dart';
import 'package:aeah_work_safety/blocs/accident/repository/accident_repository.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:aeah_work_safety/blocs/employee/repository/employee_repository.dart';
import 'package:aeah_work_safety/services/jwt_decoder.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:aeah_work_safety/constants/accident/constants.dart';
part 'add_new_accident_event.dart';
part 'add_new_accident_state.dart';

class AddNewAccidentBloc extends Bloc<AddNewAccidentEvent, AddNewAccidentState> {
  final AccidentRepository _accidentRepository = locator<AccidentRepository>();
  final EmployeeRepository _employeeRepository = locator<EmployeeRepository>();

  AddNewAccidentBloc() : super(const AddNewAccidentInitial()) {
    on<CreateNewAccident>((event, emit) async {
      const storage = FlutterSecureStorage();
      final String? token = await storage.read(key: "token");
      var user = parseJwt(token!);

      var identificationNumber = event.identificationNumber;
      try {
        EmployeeResponse employeeFilteredById =
            await _employeeRepository.getEmployeeByIdentificationNumber(filter: identificationNumber);
        List<bool> sceneOfAccidentBoolList =
            stringListToBoolList(event.accident["theSubjectOfTheAccidentStringList"], Constant.theSubjectOfTheAccident);
        List<bool> precautionsToBeTakenBoolList =
            stringListToBoolList(event.accident["precautionsToBeTakenStringList"], Constant.precautionsToBeTaken);
        List<bool> rootCauseAnalysisRequirementList =
        stringListToBoolList(event.accident["rootCauseAnalysisRequirement"], Constant.rootCauseAnalysisRequirement);
        final CreateAccidentModel _accident;
        _accident = CreateAccidentModel(
          date: event.accident["accidentDate"],
          accidentInfo: event.accident["accidentInfo"],
          performedJob: event.accident["performedJob"],
          relatedDepartment: event.accident["relatedDepartment"],
          referenceNumber: event.accident["sceneOfAccident"],
          id: 0,
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
          rootCauseAnalysis: rootCauseAnalysisRequirementList[0],
          witnessStatement: "Test",
          accidentNumber: 0,
          createAffectedEmployeeWithProperty: [
            CreateAffectedEmployeeWithProperty(
              employeeId: employeeFilteredById.data[0].id,
              lostDays: int.parse(event.accident["lostDay"]),
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
              theSubjectExposureToPhysicalViolence: sceneOfAccidentBoolList[0],
              theSubjectExposureToVerbalViolence: sceneOfAccidentBoolList[1],
              theSubjectSharpObjectInjuries: sceneOfAccidentBoolList[2],
              theSubjectExposureToBiologicalAgents: sceneOfAccidentBoolList[3],
              theSubjectFallingImpactInjuries: sceneOfAccidentBoolList[4],
              theSubjectMaterialDamagedTrafficAccident: sceneOfAccidentBoolList[5],
              theSubjectInjuredTrafficAccident: sceneOfAccidentBoolList[6],
              theSubjectExposureToChemicals: sceneOfAccidentBoolList[7],
              theSubjectExposureToFireAndBurn: sceneOfAccidentBoolList[8],
              theSubjectOfficeAccidents: sceneOfAccidentBoolList[9],
              theSubjectElectricalAccidents: sceneOfAccidentBoolList[10],
            )
          ],
        );
        await _accidentRepository.createAccident(newAccident: _accident);
        emit(const NewAccidentCreated(message: "Kaza Eklendi"));
        emit(const AddNewAccidentInitial());
      } catch (e) {
        emit(NewAccidentCreationError(message: "Kaza eklenemedi. Hata:  $e"));
      }
    });
  }
  List<bool> stringListToBoolList(List<String> firstStringList, List<String> secondStringList) {
    List<bool> boolList = secondStringList.map((e) => firstStringList.toSet().contains(e)).toList();
    return boolList;
  }
}
