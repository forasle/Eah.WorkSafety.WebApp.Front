
import 'dart:convert';

List<Accident> accidentFromJson(String str) => List<Accident>.from(json.decode(str)!.map((x) => Accident.fromJson(x)));

String accidentToJson(List<Accident> data) => json.encode(List<dynamic>.from(data!.map((x) => x!.toJson())));

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
    required this.affectedEmployeeIdWithLostDaysList,
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
  Map<String, int?> affectedEmployeeIdWithLostDaysList;

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
    affectedEmployeeIdWithLostDaysList: Map.from(json["affectedEmployeeIdWithLostDaysList"]!).map((k, v) => MapEntry<String, int?>(k, v)),
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
    "date": date?.toIso8601String(),
    "rootCauseAnalysis": rootCauseAnalysis,
    "creatorUserId": creatorUserId,
    "affectedEmployeeIdWithLostDaysList": Map.from(affectedEmployeeIdWithLostDaysList!).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}