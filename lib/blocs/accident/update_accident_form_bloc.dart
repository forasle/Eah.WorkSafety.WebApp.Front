import 'dart:async';
import 'package:aeah_work_safety/blocs/accident/models/accident.dart';
import 'package:aeah_work_safety/blocs/accident/models/create_accident_model.dart';
import 'package:aeah_work_safety/blocs/accident/repository/accident_repository.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:aeah_work_safety/services/jwt_decoder.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:aeah_work_safety/constants/accident/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UpdateAccidentFormBloc extends FormBloc<String, String> {
  final AccidentRepository _accidentRepository = locator<AccidentRepository>();
  final sceneOfAccident = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final identificationNumber = TextFieldBloc(validators: [FieldBlocValidators.required]);
  //final relatedDepartment = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final performedJob = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final accidentInfo = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final lostDay = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final accidentDate =
      InputFieldBloc<DateTime?, Object>(initialValue: null, validators: [FieldBlocValidators.required]);

  final relatedDepartment = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['Acil', 'Ortopedi'],
  );

  final theSubjectOfTheAccidentStringList = MultiSelectFieldBloc<String, dynamic>(
    validators: [FieldBlocValidators.required],
    items: Constant.theSubjectOfTheAccident,
  );
  final precautionsToBeTakenStringList = MultiSelectFieldBloc<String, dynamic>(
    validators: [FieldBlocValidators.required],
    items: Constant.precautionsToBeTaken,
  );




  UpdateAccidentFormBloc() {
    addFieldBlocs(fieldBlocs: [
      identificationNumber,
      relatedDepartment,
      sceneOfAccident,
      performedJob,
      accidentDate,
      accidentInfo,
      theSubjectOfTheAccidentStringList,
      precautionsToBeTakenStringList,
      lostDay
    ]);
  }
  @override
  Future<FutureOr<void>> onSubmitting() async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");
    var user = parseJwt(token!);
    Future.delayed(const Duration(seconds: 1));
    final CreateAccidentModel _accident;
    List<bool> sceneOfAccidentBoolList =
        stringListToBoolList(theSubjectOfTheAccidentStringList.value, Constant.theSubjectOfTheAccident);
    List<bool> precautionsToBeTakenBoolList =
        stringListToBoolList(precautionsToBeTakenStringList.value, Constant.precautionsToBeTaken);
    if(identificationNumber.value.length!=11){
      emitFailure(failureResponse: "Kimlik numarasını kontrol ediniz");
    }else{
      try{
        EmployeeResponse employeeFilteredById =
        await _accidentRepository.getEmployeeByIdentificationNumber(filter: identificationNumber.value);
        if(employeeFilteredById.data.length!=1){

          emitFailure(failureResponse: "Kimlik numarasını kontrol ediniz");
        }
        else{
          _accident = CreateAccidentModel(
            date: accidentDate.value!,
            accidentInfo: accidentInfo.value,
            performedJob: performedJob.value,
            relatedDepartment: relatedDepartment.value!,
            referenceNumber: sceneOfAccident.value,
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
            rootCauseAnalysis: false,
            witnessStatement: "Test",
            accidentNumber: 0,
            createAffectedEmployeeWithProperty: [
              CreateAffectedEmployeeWithProperty(
                  employeeId: employeeFilteredById.data[0].id,
                  lostDays: int.parse(lostDay.value),
                  thePrecautionsToBeTakenOfEmployeeAccident: {
                    "workingWithoutAuthorization": precautionsToBeTakenBoolList[0],
                    "giveOrReceiveFalseWarnings": precautionsToBeTakenBoolList[1],
                    "errorInSafety": precautionsToBeTakenBoolList[2],
                    "improperSpeed": precautionsToBeTakenBoolList[3],
                    "notUsingEquipmentProtectors": precautionsToBeTakenBoolList[4],
                    "notUsingPersonalProtectiveEquipment": precautionsToBeTakenBoolList[5],
                    "equipmentUsageError": precautionsToBeTakenBoolList[6],
                    "usingFaultyEquipment": precautionsToBeTakenBoolList[7],
                    "workingInAnUnfamiliarField": precautionsToBeTakenBoolList[8],
                    "disobeyingInstructions": precautionsToBeTakenBoolList[9],
                    "tirednessOrInsomniaOrDrowsiness": precautionsToBeTakenBoolList[10],
                    "workingWithoutDiscipline": precautionsToBeTakenBoolList[11],
                    "insufficientMachineEquipmentEnclosure": precautionsToBeTakenBoolList[12]
                  },
                  theSubjectOfTheAccidentOfEmployeeAccident: {
                    "exposureToPhsicalViolence": sceneOfAccidentBoolList[0],
                    "exposureToVerbalViolence": sceneOfAccidentBoolList[1],
                    "sharpObjectInjuries": sceneOfAccidentBoolList[2],
                    "exposureToBiologicalAgents": sceneOfAccidentBoolList[3],
                    "fallingImpactInjuries": sceneOfAccidentBoolList[4],
                    "materialDamagedTrafficAccident": sceneOfAccidentBoolList[5],
                    "injuredTrafficAccident": sceneOfAccidentBoolList[6],
                    "exposureToChemicals": sceneOfAccidentBoolList[7],
                    "exposureToFireAndBurn": sceneOfAccidentBoolList[8],
                    "officeAccidents": sceneOfAccidentBoolList[9],
                    "electricalAccidents": sceneOfAccidentBoolList[10],
                  })
            ],
          );
          await _accidentRepository.createAccident(newAccident: _accident);
          emitSuccess();
        }
      }
      catch(e){
        emitFailure(failureResponse: e.toString());
      }
    }


  }

  List<bool> stringListToBoolList(List<String> stringList, List<String> theSubjectOfTheAccident) {
    List<bool> boolList = theSubjectOfTheAccident.map((e) => stringList.toSet().contains(e)).toList();
    return boolList;
  }
}
