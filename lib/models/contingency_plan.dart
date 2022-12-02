import 'dart:convert';

ContingencyPlan contingencyPlanFromJson(String str) => ContingencyPlan.fromJson(json.decode(str));

String contingencyPlanToJson(ContingencyPlan data) => json.encode(data.toJson());

class ContingencyPlan {
  ContingencyPlan({
    required this.id,
    required this.name,
    required this.planNumber,
    required this.referenceNumber,
    required this.information,
    required this.creatorUserId,
    required this.date,
    required this.creationTime,
  });

  int id;
  String name;
  int planNumber;
  String referenceNumber;
  String information;
  int creatorUserId;
  DateTime date;
  DateTime creationTime;

  factory ContingencyPlan.fromJson(Map<String, dynamic> json) => ContingencyPlan(
    id: json["id"],
    name: json["name"],
    planNumber: json["planNumber"],
    referenceNumber: json["referenceNumber"],
    information: json["information"],
    creatorUserId: json["creatorUserId"],
    date: DateTime.parse(json["date"]),
    creationTime: DateTime.parse(json["creationTime"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "planNumber": planNumber,
    "referenceNumber": referenceNumber,
    "information": information,
    "creatorUserId": creatorUserId,
    "date": date.toIso8601String(),
    "creationTime": creationTime.toIso8601String(),
  };
}
