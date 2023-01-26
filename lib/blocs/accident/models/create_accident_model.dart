// To parse this JSON data, do
//
//     final createAccidentModel = createAccidentModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CreateAccidentModel createAccidentModelFromJson(String str) => CreateAccidentModel.fromJson(json.decode(str));

String createAccidentModelToJson(CreateAccidentModel data) => json.encode(data.toJson());

class CreateAccidentModel {
  CreateAccidentModel({
    required this.id,
    required this.accidentNumber,
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
    required this.createAffectedEmployeeWithProperty,
  });

  int id;
  int accidentNumber;
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
  List<CreateAffectedEmployeeWithProperty> createAffectedEmployeeWithProperty;

  factory CreateAccidentModel.fromJson(Map<String, dynamic> json) => CreateAccidentModel(
    id: json["id"],
    accidentNumber: json["accidentNumber"],
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
    createAffectedEmployeeWithProperty: List<CreateAffectedEmployeeWithProperty>.from(json["createAffectedEmployeeWithProperty"].map((x) => CreateAffectedEmployeeWithProperty.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "accidentNumber": accidentNumber,
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
    "createAffectedEmployeeWithProperty": List<dynamic>.from(createAffectedEmployeeWithProperty.map((x) => x.toJson())),
  };
}

class CreateAffectedEmployeeWithProperty {
  CreateAffectedEmployeeWithProperty({
    required this.employeeId,
    required this.lostDays,
    required this.thePrecautionsToBeTakenOfEmployeeAccident,
    required this.theSubjectOfTheAccidentOfEmployeeAccident,
  });

  int employeeId;
  int lostDays;
  Map<String, bool> thePrecautionsToBeTakenOfEmployeeAccident;
  Map<String, bool> theSubjectOfTheAccidentOfEmployeeAccident;

  factory CreateAffectedEmployeeWithProperty.fromJson(Map<String, dynamic> json) => CreateAffectedEmployeeWithProperty(
    employeeId: json["employeeId"],
    lostDays: json["lostDays"],
    thePrecautionsToBeTakenOfEmployeeAccident: Map.from(json["thePrecautionsToBeTakenOfEmployeeAccident"]).map((k, v) => MapEntry<String, bool>(k, v)),
    theSubjectOfTheAccidentOfEmployeeAccident: Map.from(json["theSubjectOfTheAccidentOfEmployeeAccident"]).map((k, v) => MapEntry<String, bool>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "employeeId": employeeId,
    "lostDays": lostDays,
    "thePrecautionsToBeTakenOfEmployeeAccident": Map.from(thePrecautionsToBeTakenOfEmployeeAccident).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "theSubjectOfTheAccidentOfEmployeeAccident": Map.from(theSubjectOfTheAccidentOfEmployeeAccident).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}
