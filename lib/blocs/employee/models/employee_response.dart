import 'dart:convert';

List<EmployeeResponse> employeeResponseFromJson(String str) => List<EmployeeResponse>.from(json.decode(str).map((x) => EmployeeResponse.fromJson(x)));

String employeeResponseToJson(List<EmployeeResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeResponse {
  EmployeeResponse({
    required this.id,
    required this.identificationNumber,
    required this.registrationNumber,
    required this.name,
    required this.surname,
    required this.age,
    required this.birthPlace,
    required this.nationality,
    required this.educationStatus,
    required this.riskGroup,
    required this.title,
    required this.position,
    required this.department,
    required this.startDateOfEmployment,
    required this.address,
    required this.accidents,
    required this.nearMisses,
    required this.chronicDisease,
    required this.occupationDisease,
  });

  int id;
  String identificationNumber;
  String registrationNumber;
  String name;
  String surname;
  int age;
  String birthPlace;
  String nationality;
  String educationStatus;
  String riskGroup;
  String title;
  String position;
  String department;
  DateTime startDateOfEmployment;
  String address;
  Map<String, int> accidents;
  Map<String, int> nearMisses;
  List<dynamic> chronicDisease;
  List<dynamic> occupationDisease;

  factory EmployeeResponse.fromJson(Map<String, dynamic> json) => EmployeeResponse(
    id: json["id"],
    identificationNumber: json["identificationNumber"],
    registrationNumber: json["registrationNumber"],
    name: json["name"],
    surname: json["surname"],
    age: json["age"],
    birthPlace: json["birthPlace"],
    nationality: json["nationality"],
    educationStatus: json["educationStatus"],
    riskGroup: json["riskGroup"],
    title: json["title"],
    position: json["position"],
    department: json["department"],
    startDateOfEmployment: DateTime.parse(json["startDateOfEmployment"]),
    address: json["address"],
    accidents: Map.from(json["accidents"]).map((k, v) => MapEntry<String, int>(k, v)),
    nearMisses: Map.from(json["nearMisses"]).map((k, v) => MapEntry<String, int>(k, v)),
    chronicDisease: List<dynamic>.from(json["chronicDisease"].map((x) => x)),
    occupationDisease: List<dynamic>.from(json["occupationDisease"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "identificationNumber": identificationNumber,
    "registrationNumber": registrationNumber,
    "name": name,
    "surname": surname,
    "age": age,
    "birthPlace": birthPlace,
    "nationality": nationality,
    "educationStatus": educationStatus,
    "riskGroup": riskGroup,
    "title": title,
    "position": position,
    "department": department,
    "startDateOfEmployment": startDateOfEmployment.toIso8601String(),
    "address": address,
    "accidents": Map.from(accidents).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "nearMises": Map.from(nearMisses).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "chronicDisease": List<dynamic>.from(chronicDisease.map((x) => x)),
    "occupationDisease": List<dynamic>.from(occupationDisease.map((x) => x)),
  };
}

