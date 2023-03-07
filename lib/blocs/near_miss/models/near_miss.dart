
import 'dart:convert';

List<NearMiss> nearMissFromJson(String str) => List<NearMiss>.from(json.decode(str).map((x) => NearMiss.fromJson(x)));

String nearMissToJson(List<NearMiss> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NearMiss {
  NearMiss({
    required this.id,
    required this.sceneOfNearMiss,
    required this.nearMissInfo,
    required this.performedJob,
    required this.relatedDepartment,
    required this.needFirstAid,
    required this.medicalIntervention,
    required this.eyewitnesses,
    required this.eyewitnessesName,
    required this.eyewitnessesPhoneNumber,
    required this.witnessStatement,
    required this.duringOperation,
    required this.propertyDamage,
    required this.businessStopped,
    required this.cameraRecording,
    required this.nearMissDate,
    required this.rootCauseAnalysis,
    required this.creatorUserId,
    required this.affectedEmployeeWithPropertyForNearMiss,
  });

  int id;
  String sceneOfNearMiss;
  String nearMissInfo;
  String performedJob;
  String relatedDepartment;
  bool needFirstAid;
  bool medicalIntervention;
  bool eyewitnesses;
  String eyewitnessesName;
  String eyewitnessesPhoneNumber;
  String witnessStatement;
  bool duringOperation;
  bool propertyDamage;
  bool businessStopped;
  bool cameraRecording;
  DateTime nearMissDate;
  bool rootCauseAnalysis;
  int creatorUserId;
  List<AffectedEmployeeWithPropertyForNearMiss> affectedEmployeeWithPropertyForNearMiss;

  factory NearMiss.fromJson(Map<String, dynamic> json) => NearMiss(
    id: json["id"],
    sceneOfNearMiss: json["sceneOfNearMiss"],
    nearMissInfo: json["nearMissInfo"],
    performedJob: json["performedJob"],
    relatedDepartment: json["relatedDepartment"],
    needFirstAid: json["needFirstAid"],
    medicalIntervention: json["medicalIntervention"],
    eyewitnesses: json["eyewitnesses"],
    eyewitnessesName: json["eyewitnessesName"],
    eyewitnessesPhoneNumber: json["eyewitnessesPhoneNumber"],
    witnessStatement: json["witnessStatement"],
    duringOperation: json["duringOperation"],
    propertyDamage: json["propertyDamage"],
    businessStopped: json["businessStopped"],
    cameraRecording: json["cameraRecording"],
    nearMissDate: DateTime.parse(json["nearMissDate"]),
    rootCauseAnalysis: json["rootCauseAnalysis"],
    creatorUserId: json["creatorUserId"],
    affectedEmployeeWithPropertyForNearMiss: List<AffectedEmployeeWithPropertyForNearMiss>.from(json["affectedEmployeeWithPropertyForNearMiss"].map((x) => AffectedEmployeeWithPropertyForNearMiss.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sceneOfNearMiss": sceneOfNearMiss,
    "nearMissInfo": nearMissInfo,
    "performedJob": performedJob,
    "relatedDepartment": relatedDepartment,
    "needFirstAid": needFirstAid,
    "medicalIntervention": medicalIntervention,
    "eyewitnesses": eyewitnesses,
    "eyewitnessesName": eyewitnessesName,
    "eyewitnessesPhoneNumber": eyewitnessesPhoneNumber,
    "witnessStatement": witnessStatement,
    "duringOperation": duringOperation,
    "propertyDamage": propertyDamage,
    "businessStopped": businessStopped,
    "cameraRecording": cameraRecording,
    "nearMissDate": nearMissDate.toIso8601String(),
    "rootCauseAnalysis": rootCauseAnalysis,
    "creatorUserId": creatorUserId,
    "affectedEmployeeWithPropertyForNearMiss": List<dynamic>.from(affectedEmployeeWithPropertyForNearMiss.map((x) => x.toJson())),
  };
}

class AffectedEmployeeWithPropertyForNearMiss {
  AffectedEmployeeWithPropertyForNearMiss({
    required this.employeeId,
    required this.lostDays,
    required this.name,
    required this.surname,
    required this.identificationNumber,
    required this.theSubjectExposureToPhysicalViolence,
    required this.theSubjectExposureToVerbalViolence,
    required this.theSubjectSharpObjectInjuries,
    required this.theSubjectExposureToBiologicalAgents,
    required this.theSubjectFallingImpactInjuries,
    required this.theSubjectMaterialDamagedTrafficAccident,
    required this.theSubjectInjuredTrafficAccident,
    required this.theSubjectExposureToChemicals,
    required this.theSubjectExposureToFireAndBurn,
    required this.theSubjectOfficeAccidents,
    required this.theSubjectElectricalAccidents,
    required this.thePrecautionsWorkingWithoutAuthorization,
    required this.thePrecautionsGiveOrReceiveFalseWarnings,
    required this.thePrecautionsErrorInSafety,
    required this.thePrecautionsImproperSpeed,
    required this.thePrecautionsNotUsingEquipmentProtectors,
    required this.thePrecautionsNotUsingPersonalProtectiveEquipment,
    required this.thePrecautionsEquipmentUsageError,
    required this.thePrecautionsUsingFaultyEquipment,
    required this.thePrecautionsWorkingInAnUnfamiliarField,
    required this.thePrecautionsDisobeyingInstructions,
    required this.thePrecautionsTirednessOrInsomniaOrDrowsiness,
    required this.thePrecautionsWorkingWithoutDiscipline,
    required this.thePrecautionsInsufficientMachineEquipmentEnclosure,
  });

  int employeeId;
  int lostDays;
  String name;
  String surname;
  String identificationNumber;
  bool theSubjectExposureToPhysicalViolence;
  bool theSubjectExposureToVerbalViolence;
  bool theSubjectSharpObjectInjuries;
  bool theSubjectExposureToBiologicalAgents;
  bool theSubjectFallingImpactInjuries;
  bool theSubjectMaterialDamagedTrafficAccident;
  bool theSubjectInjuredTrafficAccident;
  bool theSubjectExposureToChemicals;
  bool theSubjectExposureToFireAndBurn;
  bool theSubjectOfficeAccidents;
  bool theSubjectElectricalAccidents;
  bool thePrecautionsWorkingWithoutAuthorization;
  bool thePrecautionsGiveOrReceiveFalseWarnings;
  bool thePrecautionsErrorInSafety;
  bool thePrecautionsImproperSpeed;
  bool thePrecautionsNotUsingEquipmentProtectors;
  bool thePrecautionsNotUsingPersonalProtectiveEquipment;
  bool thePrecautionsEquipmentUsageError;
  bool thePrecautionsUsingFaultyEquipment;
  bool thePrecautionsWorkingInAnUnfamiliarField;
  bool thePrecautionsDisobeyingInstructions;
  bool thePrecautionsTirednessOrInsomniaOrDrowsiness;
  bool thePrecautionsWorkingWithoutDiscipline;
  bool thePrecautionsInsufficientMachineEquipmentEnclosure;

  factory AffectedEmployeeWithPropertyForNearMiss.fromJson(Map<String, dynamic> json) => AffectedEmployeeWithPropertyForNearMiss(
    employeeId: json["employeeId"],
    lostDays: json["lostDays"],
    name: json["name"],
    surname: json["surname"],
    identificationNumber: json["identificationNumber"],
    theSubjectExposureToPhysicalViolence: json["theSubjectExposureToPhysicalViolence"],
    theSubjectExposureToVerbalViolence: json["theSubjectExposureToVerbalViolence"],
    theSubjectSharpObjectInjuries: json["theSubjectSharpObjectInjuries"],
    theSubjectExposureToBiologicalAgents: json["theSubjectExposureToBiologicalAgents"],
    theSubjectFallingImpactInjuries: json["theSubjectFallingImpactInjuries"],
    theSubjectMaterialDamagedTrafficAccident: json["theSubjectMaterialDamagedTrafficAccident"],
    theSubjectInjuredTrafficAccident: json["theSubjectInjuredTrafficAccident"],
    theSubjectExposureToChemicals: json["theSubjectExposureToChemicals"],
    theSubjectExposureToFireAndBurn: json["theSubjectExposureToFireAndBurn"],
    theSubjectOfficeAccidents: json["theSubjectOfficeAccidents"],
    theSubjectElectricalAccidents: json["theSubjectElectricalAccidents"],
    thePrecautionsWorkingWithoutAuthorization: json["thePrecautionsWorkingWithoutAuthorization"],
    thePrecautionsGiveOrReceiveFalseWarnings: json["thePrecautionsGiveOrReceiveFalseWarnings"],
    thePrecautionsErrorInSafety: json["thePrecautionsErrorInSafety"],
    thePrecautionsImproperSpeed: json["thePrecautionsImproperSpeed"],
    thePrecautionsNotUsingEquipmentProtectors: json["thePrecautionsNotUsingEquipmentProtectors"],
    thePrecautionsNotUsingPersonalProtectiveEquipment: json["thePrecautionsNotUsingPersonalProtectiveEquipment"],
    thePrecautionsEquipmentUsageError: json["thePrecautionsEquipmentUsageError"],
    thePrecautionsUsingFaultyEquipment: json["thePrecautionsUsingFaultyEquipment"],
    thePrecautionsWorkingInAnUnfamiliarField: json["thePrecautionsWorkingInAnUnfamiliarField"],
    thePrecautionsDisobeyingInstructions: json["thePrecautionsDisobeyingInstructions"],
    thePrecautionsTirednessOrInsomniaOrDrowsiness: json["thePrecautionsTirednessOrInsomniaOrDrowsiness"],
    thePrecautionsWorkingWithoutDiscipline: json["thePrecautionsWorkingWithoutDiscipline"],
    thePrecautionsInsufficientMachineEquipmentEnclosure: json["thePrecautionsInsufficientMachineEquipmentEnclosure"],
  );

  Map<String, dynamic> toJson() => {
    "employeeId": employeeId,
    "lostDays": lostDays,
    "name": name,
    "surname": surname,
    "identificationNumber": identificationNumber,
    "theSubjectExposureToPhysicalViolence": theSubjectExposureToPhysicalViolence,
    "theSubjectExposureToVerbalViolence": theSubjectExposureToVerbalViolence,
    "theSubjectSharpObjectInjuries": theSubjectSharpObjectInjuries,
    "theSubjectExposureToBiologicalAgents": theSubjectExposureToBiologicalAgents,
    "theSubjectFallingImpactInjuries": theSubjectFallingImpactInjuries,
    "theSubjectMaterialDamagedTrafficAccident": theSubjectMaterialDamagedTrafficAccident,
    "theSubjectInjuredTrafficAccident": theSubjectInjuredTrafficAccident,
    "theSubjectExposureToChemicals": theSubjectExposureToChemicals,
    "theSubjectExposureToFireAndBurn": theSubjectExposureToFireAndBurn,
    "theSubjectOfficeAccidents": theSubjectOfficeAccidents,
    "theSubjectElectricalAccidents": theSubjectElectricalAccidents,
    "thePrecautionsWorkingWithoutAuthorization": thePrecautionsWorkingWithoutAuthorization,
    "thePrecautionsGiveOrReceiveFalseWarnings": thePrecautionsGiveOrReceiveFalseWarnings,
    "thePrecautionsErrorInSafety": thePrecautionsErrorInSafety,
    "thePrecautionsImproperSpeed": thePrecautionsImproperSpeed,
    "thePrecautionsNotUsingEquipmentProtectors": thePrecautionsNotUsingEquipmentProtectors,
    "thePrecautionsNotUsingPersonalProtectiveEquipment": thePrecautionsNotUsingPersonalProtectiveEquipment,
    "thePrecautionsEquipmentUsageError": thePrecautionsEquipmentUsageError,
    "thePrecautionsUsingFaultyEquipment": thePrecautionsUsingFaultyEquipment,
    "thePrecautionsWorkingInAnUnfamiliarField": thePrecautionsWorkingInAnUnfamiliarField,
    "thePrecautionsDisobeyingInstructions": thePrecautionsDisobeyingInstructions,
    "thePrecautionsTirednessOrInsomniaOrDrowsiness": thePrecautionsTirednessOrInsomniaOrDrowsiness,
    "thePrecautionsWorkingWithoutDiscipline": thePrecautionsWorkingWithoutDiscipline,
    "thePrecautionsInsufficientMachineEquipmentEnclosure": thePrecautionsInsufficientMachineEquipmentEnclosure,
  };
}
