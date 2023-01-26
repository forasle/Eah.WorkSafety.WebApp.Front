// To parse this JSON data, do
//
//     final createNearMissModel = createNearMissModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CreateNearMissModel createNearMissModelFromJson(String str) => CreateNearMissModel.fromJson(json.decode(str));

String createNearMissModelToJson(CreateNearMissModel data) => json.encode(data.toJson());

class CreateNearMissModel {
  CreateNearMissModel({
    required this.id,
    required this.nearMissNumber,
    required this.referenceNumber,
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
    required this.date,
    required this.rootCauseAnalysis,
    required this.creatorUserId,
    required this.createAffectedEmployeeWithPropertyForNearMiss,
  });

  int id;
  int nearMissNumber;
  String referenceNumber;
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
  DateTime date;
  bool rootCauseAnalysis;
  int creatorUserId;
  List<CreateAffectedEmployeeWithPropertyForNearMiss> createAffectedEmployeeWithPropertyForNearMiss;

  factory CreateNearMissModel.fromJson(Map<String, dynamic> json) => CreateNearMissModel(
    id: json["id"],
    nearMissNumber: json["nearMissNumber"],
    referenceNumber: json["referenceNumber"],
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
    date: DateTime.parse(json["date"]),
    rootCauseAnalysis: json["rootCauseAnalysis"],
    creatorUserId: json["creatorUserId"],
    createAffectedEmployeeWithPropertyForNearMiss: List<CreateAffectedEmployeeWithPropertyForNearMiss>.from(json["createAffectedEmployeeWithPropertyForNearMiss"].map((x) => CreateAffectedEmployeeWithPropertyForNearMiss.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nearMissNumber": nearMissNumber,
    "referenceNumber": referenceNumber,
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
    "date": date.toIso8601String(),
    "rootCauseAnalysis": rootCauseAnalysis,
    "creatorUserId": creatorUserId,
    "createAffectedEmployeeWithPropertyForNearMiss": List<dynamic>.from(createAffectedEmployeeWithPropertyForNearMiss.map((x) => x.toJson())),
  };
}

class CreateAffectedEmployeeWithPropertyForNearMiss {
  CreateAffectedEmployeeWithPropertyForNearMiss({
    required this.employeeId,
    required this.lostDays,
  });

  int employeeId;
  int lostDays;

  factory CreateAffectedEmployeeWithPropertyForNearMiss.fromJson(Map<String, dynamic> json) => CreateAffectedEmployeeWithPropertyForNearMiss(
    employeeId: json["employeeId"],
    lostDays: json["lostDays"],
  );

  Map<String, dynamic> toJson() => {
    "employeeId": employeeId,
    "lostDays": lostDays,
  };
}
