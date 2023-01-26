// To parse this JSON data, do
//
//     final nearMiss = nearMissFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<NearMiss> nearMissFromJson(String str) => List<NearMiss>.from(json.decode(str).map((x) => NearMiss.fromJson(x)));

String nearMissToJson(List<NearMiss> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NearMiss {
  NearMiss({
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
    required this.affectedEmployeeWithPropertyForNearMiss,
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
  List<AffectedEmployeeWithPropertyForNearMiss> affectedEmployeeWithPropertyForNearMiss;

  factory NearMiss.fromJson(Map<String, dynamic> json) => NearMiss(
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
    affectedEmployeeWithPropertyForNearMiss: List<AffectedEmployeeWithPropertyForNearMiss>.from(json["affectedEmployeeWithPropertyForNearMiss"].map((x) => AffectedEmployeeWithPropertyForNearMiss.fromJson(x))),
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
    "affectedEmployeeWithPropertyForNearMiss": List<dynamic>.from(affectedEmployeeWithPropertyForNearMiss.map((x) => x.toJson())),
  };
}

class AffectedEmployeeWithPropertyForNearMiss {
  AffectedEmployeeWithPropertyForNearMiss({
    required this.employeeId,
    required this.lostDays,
  });

  int employeeId;
  int lostDays;

  factory AffectedEmployeeWithPropertyForNearMiss.fromJson(Map<String, dynamic> json) => AffectedEmployeeWithPropertyForNearMiss(
    employeeId: json["employeeId"],
    lostDays: json["lostDays"],
  );

  Map<String, dynamic> toJson() => {
    "employeeId": employeeId,
    "lostDays": lostDays,
  };
}
