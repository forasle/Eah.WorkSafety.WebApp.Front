// To parse this JSON data, do
//
//     final accident = accidentFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Accident> accidentFromJson(String str) => List<Accident>.from(json.decode(str).map((x) => Accident.fromJson(x)));

String accidentToJson(List<Accident> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Accident {
  Accident({
    required this.id,
    required this.referenceNumber,
    required this.accidentInfo,
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
    required this.date,
    required this.rootCauseAnalysis,
    required this.creatorUserId,
    required this.affectedEmployeeWithPropertyForAccident,
  });

  int id;
  String referenceNumber;
  String accidentInfo;
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
  DateTime date;
  bool rootCauseAnalysis;
  int creatorUserId;
  List<AffectedEmployeeWithPropertyForAccident> affectedEmployeeWithPropertyForAccident;

  factory Accident.fromJson(Map<String, dynamic> json) => Accident(
    id: json["id"],
    referenceNumber: json["referenceNumber"],
    accidentInfo: json["accidentInfo"],
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
    date: DateTime.parse(json["date"]),
    rootCauseAnalysis: json["rootCauseAnalysis"],
    creatorUserId: json["creatorUserId"],
    affectedEmployeeWithPropertyForAccident: List<AffectedEmployeeWithPropertyForAccident>.from(json["affectedEmployeeWithPropertyForAccident"].map((x) => AffectedEmployeeWithPropertyForAccident.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "referenceNumber": referenceNumber,
    "accidentInfo": accidentInfo,
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
    "date": date.toIso8601String(),
    "rootCauseAnalysis": rootCauseAnalysis,
    "creatorUserId": creatorUserId,
    "affectedEmployeeWithPropertyForAccident": List<dynamic>.from(affectedEmployeeWithPropertyForAccident.map((x) => x.toJson())),
  };
}

class AffectedEmployeeWithPropertyForAccident {
  AffectedEmployeeWithPropertyForAccident({
    required this.employeeId,
    required this.lostDays,
    required this.name,
    required this.surname,
    required this.identificationNumber,
    required this.theSubjectExposureToPhsicalViolence,
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
  bool theSubjectExposureToPhsicalViolence;
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

  factory AffectedEmployeeWithPropertyForAccident.fromJson(Map<String, dynamic> json) => AffectedEmployeeWithPropertyForAccident(
    employeeId: json["employeeId"],
    lostDays: json["lostDays"],
    name: json["name"],
    surname: json["surname"],
    identificationNumber: json["identificationNumber"],
    theSubjectExposureToPhsicalViolence: json["theSubjectExposureToPhysicalViolence"],
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
    "theSubjectExposureToPhsicalViolence": theSubjectExposureToPhsicalViolence,
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
