// To parse this JSON data, do
//
//     final occupationDisease = occupationDiseaseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<OccupationDisease> occupationDiseaseFromJson(String str) => List<OccupationDisease>.from(json.decode(str).map((x) => OccupationDisease.fromJson(x)));

String occupationDiseaseToJson(List<OccupationDisease> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OccupationDisease {
  OccupationDisease({
    required this.id,
    required this.referenceNumber,
    required this.diagnosis,
    required this.affectedEmployeeByOccupationDisease,
  });

  int id;
  String referenceNumber;
  String diagnosis;
  List<AffectedEmployeeByOccupationDisease> affectedEmployeeByOccupationDisease;

  factory OccupationDisease.fromJson(Map<String, dynamic> json) => OccupationDisease(
    id: json["id"],
    referenceNumber: json["referenceNumber"],
    diagnosis: json["diagnosis"],
    affectedEmployeeByOccupationDisease: List<AffectedEmployeeByOccupationDisease>.from(json["affectedEmployeeByOccupationDisease"].map((x) => AffectedEmployeeByOccupationDisease.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "referenceNumber": referenceNumber,
    "diagnosis": diagnosis,
    "affectedEmployeeByOccupationDisease": List<dynamic>.from(affectedEmployeeByOccupationDisease.map((x) => x.toJson())),
  };
}

class AffectedEmployeeByOccupationDisease {
  AffectedEmployeeByOccupationDisease({
    required this.employeeId,
  });

  int employeeId;

  factory AffectedEmployeeByOccupationDisease.fromJson(Map<String, dynamic> json) => AffectedEmployeeByOccupationDisease(
    employeeId: json["employeeId"],
  );

  Map<String, dynamic> toJson() => {
    "employeeId": employeeId,
  };
}
