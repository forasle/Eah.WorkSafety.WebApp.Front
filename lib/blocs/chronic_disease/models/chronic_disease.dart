// To parse this JSON data, do
//
//     final chronicDisease = chronicDiseaseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ChronicDisease> chronicDiseaseFromJson(String str) => List<ChronicDisease>.from(json.decode(str).map((x) => ChronicDisease.fromJson(x)));

String chronicDiseaseToJson(List<ChronicDisease> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChronicDisease {
  ChronicDisease({
    required this.id,
    required this.referenceNumber,
    required this.diagnosis,
    required this.affectedEmployeeByChronicDisease,
  });

  int id;
  String referenceNumber;
  String diagnosis;
  List<AffectedEmployeeByChronicDisease> affectedEmployeeByChronicDisease;

  factory ChronicDisease.fromJson(Map<String, dynamic> json) => ChronicDisease(
    id: json["id"],
    referenceNumber: json["referenceNumber"],
    diagnosis: json["diagnosis"],
    affectedEmployeeByChronicDisease: List<AffectedEmployeeByChronicDisease>.from(json["affectedEmployeeByChronicDisease"].map((x) => AffectedEmployeeByChronicDisease.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "referenceNumber": referenceNumber,
    "diagnosis": diagnosis,
    "affectedEmployeeByChronicDisease": List<dynamic>.from(affectedEmployeeByChronicDisease.map((x) => x.toJson())),
  };
}

class AffectedEmployeeByChronicDisease {
  AffectedEmployeeByChronicDisease({
    required this.employeeId,
  });

  int employeeId;

  factory AffectedEmployeeByChronicDisease.fromJson(Map<String, dynamic> json) => AffectedEmployeeByChronicDisease(
    employeeId: json["employeeId"],
  );

  Map<String, dynamic> toJson() => {
    "employeeId": employeeId,
  };
}
