import 'dart:convert';

Accident accidentFromJson(String str) => Accident.fromJson(json.decode(str));

String accidentToJson(Accident data) => json.encode(data.toJson());

class Accident {
  Accident({
    required this.id,
    required this.referenceNumber,
    required this.accidentInfo,
    required this.date,
    required this.rootCauseAnalysis,
    required this.lostDays,
    required this.creatorUserId,
    required this.employees,
  });

  int id;
  String referenceNumber;
  String accidentInfo;
  DateTime date;
  bool rootCauseAnalysis;
  int lostDays;
  int creatorUserId;
  List<int> employees;

  factory Accident.fromJson(Map<String, dynamic> json) => Accident(
    id: json["id"],
    referenceNumber: json["referenceNumber"],
    accidentInfo: json["accidentInfo"],
    date: DateTime.parse(json["date"]),
    rootCauseAnalysis: json["rootCauseAnalysis"],
    lostDays: json["lostDays"],
    creatorUserId: json["creatorUserId"],
    employees: List<int>.from(json["employees"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "referenceNumber": referenceNumber,
    "accidentInfo": accidentInfo,
    "date": date.toIso8601String(),
    "rootCauseAnalysis": rootCauseAnalysis,
    "lostDays": lostDays,
    "creatorUserId": creatorUserId,
    "employees": List<dynamic>.from(employees.map((x) => x)),
  };
}
