// To parse this JSON data, do
//
//     final employee = employeeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Employee> employeeFromJson(String str) => List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeToJson(List<Employee> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employee {
  Employee({
    required this.id,
    required this.identificationNumber,
    required this.registrationNumber,
    required this.name,
    required this.surname,
    required this.age,
    required this.gender,
    required this.birthPlace,
    required this.nationality,
    required this.educationStatus,
    required this.riskGroup,
    required this.title,
    required this.position,
    required this.department,
    required this.startDateOfEmployment,
    required this.address,
    required this.affectedAccident,
    required this.affectedNearMisses,
    required this.affectedChronicDisease,
    required this.affectedOccupationDisease,
  });

  int id;
  String identificationNumber;
  String registrationNumber;
  String name;
  String surname;
  int age;
  int gender;
  String birthPlace;
  String nationality;
  String educationStatus;
  String riskGroup;
  String title;
  String position;
  int department;
  DateTime startDateOfEmployment;
  String address;
  List<AffectedAccident> affectedAccident;
  List<AffectedNearMiss> affectedNearMisses;
  List<AffectedChronicDisease> affectedChronicDisease;
  List<AffectedOccupationDisease> affectedOccupationDisease;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id: json["id"],
    identificationNumber: json["identificationNumber"],
    registrationNumber: json["registrationNumber"],
    name: json["name"],
    surname: json["surname"],
    age: json["age"],
    gender: json["gender"],
    birthPlace: json["birthPlace"],
    nationality: json["nationality"],
    educationStatus: json["educationStatus"],
    riskGroup: json["riskGroup"],
    title: json["title"],
    position: json["position"],
    department: json["department"],
    startDateOfEmployment: DateTime.parse(json["startDateOfEmployment"]),
    address: json["address"],
    affectedAccident: List<AffectedAccident>.from(json["affectedAccident"].map((x) => AffectedAccident.fromJson(x))),
    affectedNearMisses: List<AffectedNearMiss>.from(json["affectedNearMisses"].map((x) => AffectedNearMiss.fromJson(x))),
    affectedChronicDisease: List<AffectedChronicDisease>.from(json["affectedChronicDisease"].map((x) => AffectedChronicDisease.fromJson(x))),
    affectedOccupationDisease: List<AffectedOccupationDisease>.from(json["affectedOccupationDisease"].map((x) => AffectedOccupationDisease.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "identificationNumber": identificationNumber,
    "registrationNumber": registrationNumber,
    "name": name,
    "surname": surname,
    "age": age,
    "gender": gender,
    "birthPlace": birthPlace,
    "nationality": nationality,
    "educationStatus": educationStatus,
    "riskGroup": riskGroup,
    "title": title,
    "position": position,
    "department": department,
    "startDateOfEmployment": startDateOfEmployment.toIso8601String(),
    "address": address,
    "affectedAccident": List<dynamic>.from(affectedAccident.map((x) => x.toJson())),
    "affectedNearMisses": List<dynamic>.from(affectedNearMisses.map((x) => x.toJson())),
    "affectedChronicDisease": List<dynamic>.from(affectedChronicDisease.map((x) => x.toJson())),
    "affectedOccupationDisease": List<dynamic>.from(affectedOccupationDisease.map((x) => x.toJson())),
  };
}

class AffectedAccident {
  AffectedAccident({
    required this.accidentId,
  });

  int accidentId;

  factory AffectedAccident.fromJson(Map<String, dynamic> json) => AffectedAccident(
    accidentId: json["accidentId"],
  );

  Map<String, dynamic> toJson() => {
    "accidentId": accidentId,
  };
}

class AffectedChronicDisease {
  AffectedChronicDisease({
    required this.chronicDiseaseId,
  });

  int chronicDiseaseId;

  factory AffectedChronicDisease.fromJson(Map<String, dynamic> json) => AffectedChronicDisease(
    chronicDiseaseId: json["chronicDiseaseId"],
  );

  Map<String, dynamic> toJson() => {
    "chronicDiseaseId": chronicDiseaseId,
  };
}

class AffectedNearMiss {
  AffectedNearMiss({
    required this.nearMissId,
  });

  int nearMissId;

  factory AffectedNearMiss.fromJson(Map<String, dynamic> json) => AffectedNearMiss(
    nearMissId: json["nearMissId"],
  );

  Map<String, dynamic> toJson() => {
    "nearMissId": nearMissId,
  };
}

class AffectedOccupationDisease {
  AffectedOccupationDisease({
    required this.occupationDiseaseId,
  });

  int occupationDiseaseId;

  factory AffectedOccupationDisease.fromJson(Map<String, dynamic> json) => AffectedOccupationDisease(
    occupationDiseaseId: json["occupationDiseaseId"],
  );

  Map<String, dynamic> toJson() => {
    "occupationDiseaseId": occupationDiseaseId,
  };
}
