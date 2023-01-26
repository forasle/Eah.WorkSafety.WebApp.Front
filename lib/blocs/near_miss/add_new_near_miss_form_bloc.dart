import 'dart:async';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:aeah_work_safety/blocs/near_miss/models/create_near_miss_model.dart';
import 'package:aeah_work_safety/blocs/near_miss/repository/near_miss_repository.dart';
import 'package:aeah_work_safety/services/jwt_decoder.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AddNewNearMissFormBloc extends FormBloc<String, String> {
  final NearMissRepository _nearMissRepository = locator<NearMissRepository>();
  final sceneOfNearMiss = TextFieldBloc(validators: [FieldBlocValidators.required] );
  final identificationNumber = TextFieldBloc(validators: [FieldBlocValidators.required]);
  //final relatedDepartment = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final performedJob = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final nearMissInfo = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final lostDay = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final nearMissDate =
      InputFieldBloc<DateTime?, Object>(initialValue: null, validators: [FieldBlocValidators.required]);

  final relatedDepartment = SelectFieldBloc(
    validators: [FieldBlocValidators.required],
    items: ['Acil', 'Ortopedi'],
  );

  AddNewNearMissFormBloc() {
    addFieldBlocs(fieldBlocs: [
      identificationNumber,
      relatedDepartment,
      sceneOfNearMiss,
      performedJob,
      nearMissDate,
      nearMissInfo,
      lostDay
    ]);
  }
  @override
  Future<FutureOr<void>> onSubmitting() async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");
    var user = parseJwt(token!);
    Future.delayed(const Duration(seconds: 1));
    final CreateNearMissModel _nearMiss;
    if (identificationNumber.value.length != 11) {
      emitFailure(failureResponse: "Kimlik numarasını kontrol ediniz");
    } else {
      try {
        EmployeeResponse employeeFilteredById =
            await _nearMissRepository.getEmployeeByIdentificationNumber(filter: identificationNumber.value);
        if (employeeFilteredById.data.length != 1) {
          emitFailure(failureResponse: "Kimlik numarasını kontrol ediniz");
        } else {
          _nearMiss = CreateNearMissModel(
            date: nearMissDate.value!,
            nearMissInfo: nearMissInfo.value,
            performedJob: performedJob.value,
            relatedDepartment: relatedDepartment.value!,
            referenceNumber: sceneOfNearMiss.value,
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
            nearMissNumber: 0,
            createAffectedEmployeeWithPropertyForNearMiss: [
              CreateAffectedEmployeeWithPropertyForNearMiss(
                  employeeId: employeeFilteredById.data[0].id, lostDays: int.parse(lostDay.value))
            ],
          );
          await _nearMissRepository.createNearMiss(newNearMiss: _nearMiss);
          emitSuccess();
        }
      } catch (e) {
        emitFailure(failureResponse: e.toString());
      }
    }
  }

  List<bool> stringListToBoolList(List<String> stringList, List<String> theSubjectOfTheNearMiss) {
    List<bool> boolList = theSubjectOfTheNearMiss.map((e) => stringList.toSet().contains(e)).toList();
    return boolList;
  }
}
